class AjaxController < ApplicationController
  def portfolio_detail
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
end
