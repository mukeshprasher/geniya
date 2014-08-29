class InvitesController < ApplicationController
  def index
    respond_to do |format|
      format.html
    end
  end
  def contacts
    @contacts = request.env['omnicontacts.contacts']
    respond_to do |format|
      format.html
    end

#    if(UserMailer.invite_contacts(@contacts, current_user).deliver)
#      redirect_to current_user
#      flash[:success] = "Invitation message has been sent."
#    else
#      flash[:error] = "Error sending email."
#    end    
  end 
end

