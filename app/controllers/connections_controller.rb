class ConnectionsController < ApplicationController
  before_action :signed_in_user, only: [:update, :destroy, :create]
  def create
    @user = User.find(params[:connection][:connection_id])
    Connection.connection_request(params[:connection][:user_id], params[:connection][:connection_id])
  end

  def update
    @user = User.find(params[:connection][:connection_id])
    Connection.accept_or_reject(params[:connection][:user_id], params[:connection][:connection_id], params['commit'].downcase)
  end

  def destroy
    @user = User.find(params[:connection][:connection_id])
    Connection.remove(params[:connection][:user_id], params[:connection][:connection_id])
  end
end
