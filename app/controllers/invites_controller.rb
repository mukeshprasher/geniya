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
  end 
end

