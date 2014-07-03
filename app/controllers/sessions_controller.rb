class SessionsController < ApplicationController
  def new
    if params.has_key?(:a) and params[:a].present?
      user = User.find_by(status: params[:a])
      if !user.nil?
        user.status = 'active'
        if user.save
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
    if user.status != 'active'
      flash.now[:error] = 'Please check your email for activation link.'
      render 'new'
    elsif user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or root_url
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

    def destroy
        sign_out
        redirect_to root_url
    end
end
