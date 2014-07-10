class PaymentSubscriptionsController < ApplicationController
  before_action :set_payment_subscription, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, :except => [:new]

  # GET /payment_subscriptions
  # GET /payment_subscriptions.json
  def index
    @payment_subscriptions = PaymentSubscription.all
  end

  # GET /payment_subscriptions/1
  # GET /payment_subscriptions/1.json
  def show
  end

  # GET /payment_subscriptions/new
  def new
    @payment_subscription = PaymentSubscription.new
  end

  # GET /payment_subscriptions/1/edit
  def edit
  end

  # POST /payment_subscriptions
  # POST /payment_subscriptions.json
  def create
    @payment_subscription = PaymentSubscription.new(payment_subscription_params)

    respond_to do |format|
      if @payment_subscription.save
        format.html { redirect_to @payment_subscription, notice: 'Payment subscription was successfully created.' }
        format.json { render action: 'show', status: :created, location: @payment_subscription }
      else
        format.html { render action: 'new' }
        format.json { render json: @payment_subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payment_subscriptions/1
  # PATCH/PUT /payment_subscriptions/1.json
  def update
    respond_to do |format|
      if @payment_subscription.update(payment_subscription_params)
        format.html { redirect_to @payment_subscription, notice: 'Payment subscription was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @payment_subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_subscriptions/1
  # DELETE /payment_subscriptions/1.json
  def destroy
    @payment_subscription.destroy
    respond_to do |format|
      format.html { redirect_to payment_subscriptions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_subscription
      @payment_subscription = PaymentSubscription.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_subscription_params
      params.require(:payment_subscription).permit(:user_id, :business, :subscr_id, :custom, :txn_type, :subscr_date, :period3, :item_name, :item_number, :amount3, :mc_amount3, :mc_currency, :first_name, :last_name, :address_name, :address_status, :address_street, :address_city, :address_state, :address_zip, :address_country, :address_country_code, :residence_country, :status, :shipment_sent, :invoice)
    end
end
