class InvitesController < ApplicationController
  def index
    respond_to do |format|
      format.html
    end
  end
  def contacts
    @contacts = request.env['omnicontacts.contacts']
    respond_to do |format|
      if(UserMailer.invite_contacts(@contacts, current_user).deliver)
    #        flash[:success] = "Your Request is send for Quote."
      else
        flash[:error] = "Error sending email."
      end    
      format.html
    end    
  end 
end

