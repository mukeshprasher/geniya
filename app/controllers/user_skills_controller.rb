class UserSkillsController < ApplicationController
  before_action :correct_user

  def destroy
    @user_skill.destroy
  end

  private
    def correct_user
      @user_skill = UserSkill.find(params[:id])
      redirect_to(root_url) unless current_user?(@user_skill.user)
    end
end
