class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  include CategoriesHelper
  include ResponsesHelper
  include ApplicationHelper
  
  before_action :set_categories
  before_action :clear_notifications, only: [:show]
  before_action :update_user_last_seen 
end
