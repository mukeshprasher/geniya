class CommentsController < ApplicationController
  def create
    @comment_hash = params[:comment]
    @obj = @comment_hash[:commentable_type].constantize.find(@comment_hash[:commentable_id])
    @comment = Comment.build_from(@obj, current_user.id, sanitize_and_linkify_text(@comment_hash[:body]))
    if @comment.save
      if @comment_hash[:parent_id]
        @parent_comment = Comment.find(@comment_hash[:parent_id])
        @comment.move_to_child_of(@parent_comment)
      end
      mention_users_in_text(@comment_hash[:body], @comment)
      @new_comment = Comment.build_from(@obj, current_user.id, "")
#      render :partial => "comments/comment", :locals => { :comment => @comment  }, :layout => false, :status => :created

      # Picture, Album, Status update, Video, Organization or Comment
      create_response(@obj, 'comment')
    else
      render :js => "alert('error saving comment');"
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @obj = @comment.commentable_type.constantize.find(@comment.commentable_id)
    destroy_response(@obj, 'comment')
    @comment.destroy
#    if @comment.destroy
#      render :json => @comment, :status => :ok
#    else
#      render :js => "alert('error deleting comment');"
#    end
  end
  
  private

    def mention_users_in_text(text, mentioner)
      mentions = text.split.find_all{|word| /^@.+/.match word}
      users = mentions.map{|tag| User.find_by_username(tag[1..-1])}
      users.each {|user| mentioner.mention!(user) unless user.nil? }
    end  
  
end
