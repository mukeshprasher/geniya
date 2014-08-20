module ApplicationHelper

  def update_user_last_seen
    if signed_in?
      current_user.update(last_seen: Time.now)
    end
  end

end




