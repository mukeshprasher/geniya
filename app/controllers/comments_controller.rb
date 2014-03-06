class CommentsController < ApplicationController
  def create
    @comment_hash = params[:comment]
    @obj = @comment_hash[:commentable_type].constantize.find(@comment_hash[:commentable_id])
    @comment = Comment.build_from(@obj, current_user.id, sanitize_and_linkify_text(@comment_hash[:body]))
    if @comment.save
      mention_users_in_text(@comment_hash[:body], @comment)
      render :partial => "comments/comment", :locals => { :comment => @comment }, :layout => false, :status => :created
    else
      render :js => "alert('error saving comment');"
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      render :json => @comment, :status => :ok
    else
      render :js => "alert('error deleting comment');"
    end
  end

  private
    def sanitize_and_linkify_text(text)
      sanitized_text = ActionController::Base.helpers.sanitize text
      mentioned_text = text.split.map do |word| 
        if /^@.+/.match word
          if user = User.find_by_username(word[1..-1])
            src = user_url(user)
            word = "<a href='#{src}'>#{word}</a>"
          else
            word
          end
        else
          word
        end
      end
      mentioned_text.join(' ')
    end

    def mention_users_in_text(text, mentioner)
      mentions = text.split.find_all{|word| /^@.+/.match word}
      users = mentions.map{|tag| User.find_by_username(tag[1..-1])}
      users.each {|user| mentioner.mention!(user) unless user.nil? }
    end  
end
