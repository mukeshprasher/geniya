class SessionsController < ApplicationController
  def new
    if params.has_key?(:a) and params[:a].present?
      user = User.find_by(status: params[:a])
      if !user.nil?
        user.status = 'active'
        if user.save(:validate => false)
          flash.now[:success] = 'Your account has been activated. Login to continue.'
        else
          flash.now[:error] = 'Error activating account.'
        end
      else
        flash.now[:error] = 'Wrong activation link.'
      end
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user.nil?
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'    
    else
      if user.status != 'active'
        flash.now[:error] = 'Please check your email for activation link.'
        render 'new'
      elsif user && user.authenticate(params[:session][:password])
        keep_signed_in = (params[:keep_signed_in].present? and !params[:keep_signed_in].nil? and params[:keep_signed_in] == 'yes') ? true : false
        sign_in(user, keep_signed_in)

        if user.chosen_plan == 'deluxe' and user.plan == 'trial'
          flash.now[:notice] = 'Please make payment to subscribe to deluxe plan'
          redirect_to new_payment_subscription_path
        else 
          if user.name.nil?
            flash.now[:notice] = 'Please enter your name.'
            redirect_to profile_edit_path user
          else
            redirect_back_or root_url
          end
        end
      else
        flash.now[:error] = 'Invalid email/password combination'
        render 'new'
      end
    end
  end

    def destroy
        sign_out if signed_in?
        redirect_to root_url
    end
end
