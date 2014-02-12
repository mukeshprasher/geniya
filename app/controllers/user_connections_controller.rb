class UserConnectionsController < ApplicationController
  before_action :signed_in_user
  
  def connect
  end
  
  def disconnect
  end
  
end
