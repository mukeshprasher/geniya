class AjaxController < ApplicationController
  def portfolio_detail
    if signed_in?
      @upload = current_user.uploads.build
    end
    @album = Album.find(params[:id])
    @user = @album.user
    impressionist @album, '', unique: [:user_id] if current_user
    @likers = @album.likers(User)
    @comments = @album.comment_threads.where('parent_id IS NULL').order('created_at desc')
    if signed_in?
      @new_comment = Comment.build_from(@album, current_user.id, "")
    end
    render @album
  end

  def mark_notifications_as_seen
    @responses = current_user.responses.order('created_at DESC').limit(100)
    #current_user.responses.where(status: 0).each {|response| response.update_attribute(:status, 1)}
    render 'mark_notifications_as_seen', layout: false
    current_user.responses.where(status: 0).each {|response| response.update_attribute(:status, 1)}
  end

  def mark_network_notifications_as_seen
    @responses = current_user.responses.order('created_at DESC').limit(100)
    #current_user.responses.where(status: 0).each {|response| response.update_attribute(:status, 1)}
    render 'mark_notifications_as_seen', layout: false
    current_user.responses.where(status: 0).each {|response| response.update_attribute(:status, 1)}
  end
end
