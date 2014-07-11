class CommentsController < ApplicationController
  before_action :signed_in_user, only: [:create, :update, :destroy]
  def create
    @comment_hash = params[:comment]
    @obj = @comment_hash[:commentable_type].constantize.find(@comment_hash[:commentable_id])
    @comment = Comment.build_from(@obj, current_user.id, sanitize_and_linkify_text(@comment_hash[:body]))
    if @comment.save
      if @comment_hash[:parent_id]
        @parent_comment = Comment.find(@comment_hash[:parent_id])
        @comment.move_to_child_of(@parent_comment)
      end
      if @obj.class.name == "Album"
        @comments = @obj.comment_threads
        @obj.comment_count = @comments.count
        @obj.save
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
    

    if @comment.has_children?
      @comment.children.each do |child|
        #Like.where(likeable_type: 'Comment', likeable_id: child.id).destroy
        destroy_all_comments_likes_activities_and_responses_of_obj(child)
        child.destroy
      end
    end
    
    destroy_all_comments_likes_activities_and_responses_of_obj(@comment)
    @comment.destroy
#    if @comment.destroy
#      render :json => @comment, :status => :ok
#    else
#      render :js => "alert('error deleting comment');"
#    end
  end

  def show
    comment = Comment.find(params[:id])
    obj = comment.commentable_type.constantize.find(comment.commentable_id)
    redirect_to obj
  end
  
  private

    def mention_users_in_text(text, mentioner)
      mentions = text.split.find_all{|word| /^@.+/.match word}
      users = mentions.map{|tag| User.find_by_username(tag[1..-1])}
      users.each {|user| mentioner.mention!(user) unless user.nil? }
    end  
  
end
