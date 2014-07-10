class PaymentsController < ApplicationController
  protect_from_forgery :except => [:create] #Otherwise the request from PayPal wouldn't make it to the controller  
  
  before_action :set_payment, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, :except => [:create]

  # GET /payments
  # GET /payments.json
  def index
    @payments = Payment.all
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
  end

  # GET /payments/new
  def new
    @payment = Payment.new
  end

  # GET /payments/1/edit
  def edit
  end

  # POST /payments
  # POST /payments.json
  def create
  
    params[:user_id]   = params[:custom]
    transaction_type      = params[:txn_type]
    payment_status        = params[:payment_status]
    subscription_id       = params[:subscr_id]
    raw_post_data         = params

    response = validate_IPN_notification(request.raw_post)
    case response
    when "VERIFIED"
      case transaction_type
      when "subscr_payment"
        #Check if txn_id already exists
        transaction_existing  = Payment.where(:txn_id => raw_post_data[:txn_id]).first
        if raw_post_data[:payment_status] == 'Completed' and transaction_existing.blank?
          @payment_subscription = PaymentSubscription.where(:subscr_id => subscription_id).first
          @payment_subscription = PaymentSubscription.new(raw_post_data) if @payment_subscription.blank?
          @payment_subscription.status = 'active'          
          if @payment_subscription.save
            raw_post_data[:subscription_id] = @payment_subscription.id
            @payment = Payment.new(raw_post_data)
            @payment.save
            if @payment.save
              @user = User.find(@payment.user_id)
              @user.plan = 'deluxe'
              @user.save validate: false
            end
          end
        end
      when "subscr_signup"
        @payment_subscription = PaymentSubscription.where(:subscr_id => subscription_id).first
        if @payment_subscription.blank?
          @payment_subscription = PaymentSubscription.new(raw_post_data)
          @payment_subscription.status = 'new'
        else
          @payment_subscription.update_attributes(raw_post_data)
          @payment_subscription.status = 'active'
        end
        
        @payment_subscription.save
      else
        @payment_subscription = PaymentSubscription.where(:subscr_id => subscription_id).first
        case transaction_type
        when "subscr_cancel"
          @payment_subscription.status = 'cancel'
          
          if @payment_subscription.save
            @user = User.find(@payment_subscription.user_id)
            @user.plan = 'trial'
            @user.save validate: false
          end
        when "subscr_failed"
          ActionMailer::Base.mail(:from => "payments@geniya.com", :to => "neeraj.singh@60degree.com", :subject => "paypal subscr_failed", :body => "#{params}").deliver            
        when "subscr_eot"
          @payment_subscription.status = 'eot'
          if @payment_subscription.save
            @user = User.find(@payment_subscription.user_id)
            @user.plan = 'trial'
            @user.save validate: false           
          end
        else
          ActionMailer::Base.mail(:from => "payments@geniya.com", :to => "neeraj.singh@60degree.com", :subject => "paypal notify", :body => "#{params}").deliver        
        end      
      end
    when "INVALID"
      # log for investigation
      ActionMailer::Base.mail(:from => "payments@geniya.com", :to => "neeraj.singh@60degree.com", :subject => "paypal INVALID #{response}", :body => "#{raw_post_data}").deliver
    else
      # error
      ActionMailer::Base.mail(:from => "payments@geniya.com", :to => "neeraj.singh@60degree.com", :subject => "paypal error #{response}", :body => "#{raw_post_data}").deliver
    end

    ActionMailer::Base.mail(:from => "all_payments@geniya.com", :to => "neeraj.singh@60degree.com", :subject => "all pay req", :body => "#{raw_post_data}").deliver

    render :nothing => true
  end

  # PATCH/PUT /payments/1
  # PATCH/PUT /payments/1.json
  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to @payment, notice: 'Payment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to payments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      #params.permit!
      params.permit(:subscr_date, :period3, :recurring, :reattempt, :mc_amount3, :amount3, :request_id, :custom, :user_id, :txn_id, :subscr_id, :item_name, :transaction_subject, :item_number, :receiver_email, :payer_email, :business, :payer_id, :receiver_id, :payment_date, :payment_status, :mc_gross, :payment_gross, :mc_fee, :payment_fee, :mc_currency, :protection_eligibility, :first_name, :last_name, :address_name, :address_street, :address_city, :address_state, :address_zip, :address_country_code, :address_country, :residence_country, :address_status, :payment_type, :txn_type, :payer_status, :verify_sign, :ipn_track_id, :test_ipn, :charset, :notify_version)
    end

  protected
    def validate_IPN_notification(raw)
      uri = URI.parse('https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_notify-validate')
      http = Net::HTTP.new(uri.host, uri.port)
      http.open_timeout = 60
      http.read_timeout = 60
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      http.use_ssl = true
      response = http.post(uri.request_uri, raw,
                           'Content-Length' => "#{raw.size}",
                           'User-Agent' => request.env['HTTP_USER_AGENT']
                         ).body
    end
end
