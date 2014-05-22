class UserTagsController < ApplicationController
  before_action :correct_user

  def destroy
    @user_tag.destroy
  end

  private
    def correct_user
      @user_tag = UserTag.find(params[:id])
      redirect_to(root_url) unless current_user?(@user_tag.user)
    end
end
