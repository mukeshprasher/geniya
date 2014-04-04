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
        elsif /:.*:/.match word
          smiley_name = word[1..-2]
          src = (File.exist?("app/assets/images/smileys/#{smiley_name}.gif")) ? "/assets/smileys/#{smiley_name}.gif" : ((File.exist?("app/assets/images/smileys/#{smiley_name}.png")) ? "/assets/smileys/#{smiley_name}.png" : false)
          word = (src) ? "<img src='#{src}' title='#{smiley_name}' width='20px' />" : word
        else
          word
        end
      end
      
      mentioned_text.join(' ')
    end

    def sanitize_and_linkify_text(text)
      sanitized_text = ActionController::Base.helpers.sanitize text
      mentioned_text = text.split.map do |word| 
        if /^#.+/.match word
          if tag = Tag.find_by_tag_name(word[1..-1])
            src = tag_url(tag)
            word = "<a href='#{src}'>#{word}</a>"
          else
            word
          end
        elsif /:.*:/.match word
          smiley_name = word[1..-2]
          src = (File.exist?("app/assets/images/smileys/#{smiley_name}.gif")) ? "/assets/smileys/#{smiley_name}.gif" : ((File.exist?("app/assets/images/smileys/#{smiley_name}.png")) ? "/assets/smileys/#{smiley_name}.png" : false)
          word = (src) ? "<img src='#{src}' title='#{smiley_name}' width='20px' />" : word
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
