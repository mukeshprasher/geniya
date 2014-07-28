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
    @video = current_user.videos.build
    if signed_in?
      @new_comment = Comment.build_from(@album, current_user.id, "")
    end
    render @album
  end

  def chat
    @new_chat = Chat.new
    @other_user = User.find(params[:id])
    @chats = Chat.where("(reciever_id = ? AND user_id = ?) OR (reciever_id = ? AND user_id = ?)", @other_user.id, current_user.id, current_user.id, @other_user.id).order('created_at DESC').limit(50).reverse
    @last_msg_id = (@chats.any?) ? @chats.first.id : 0
    render 'chat', layout: false

    Chat.where(reciever_id: current_user.id, user_id: @other_user.id, status: 'unread').each do |chat|
      chat.update_attribute(:status, 'read')
    end
  end

  def mark_notifications_as_seen
    @responses = current_user.responses.order('created_at DESC').limit(100)
    #current_user.responses.where(status: 0).each {|response| response.update_attribute(:status, 1)}
    render 'mark_notifications_as_seen', layout: false
    current_user.responses.where(status: 0).each {|response| response.update_attribute(:status, 1)}
  end

  def mark_network_notifications_as_seen
    @connection_requests = current_user.connections.where(status: 'requested').order('created_at DESC').limit(5).collect {|connection| connection.connected_user}
    
    @new_connections = current_user.connections.where(status: 'confirmed').order('created_at DESC').limit(3).collect {|connection| connection.connected_user}

    @new_relationships = current_user.reverse_relationships.order('created_at DESC').limit(5).collect {|relationship| relationship.follower}
    #current_user.responses.where(status: 0).each {|response| response.update_attribute(:status, 1)}
    render 'mark_network_notifications_as_seen', layout: false
    #current_user.responses.where(status: 0).each {|response| response.update_attribute(:status, 1)}
  end

  def mark_message_notifications_as_seen
    @chat_requests = Chat.where("reciever_id = ? AND status = ?", current_user.id, 'unread').order('created_at DESC').limit(100)
    render 'mark_message_notifications_as_seen', layout: false
  end

  def new_chats
    @other_user = User.find(params[:uid])
    @last_id = params[:lid].to_i
    if signed_in?
      @chats = Chat.where("id > ? AND ((reciever_id = ? AND user_id = ?) OR (reciever_id = ? AND user_id = ?))", @last_id,  @other_user.id, current_user.id, current_user.id, @other_user.id).order('created_at DESC').limit(50).reverse
    else
      @chats = Array.new
    end
    @sql = Chat.where("id > ? AND ((reciever_id = ? AND user_id = ?) OR (reciever_id = ? AND user_id = ?))", @last_id,  @other_user.id, current_user.id, current_user.id, @other_user.id).order('created_at DESC').limit(50).to_sql
    @last_msg_id = (@chats.any?) ? @chats.last.id : @last_id
    render 'new_chats', layout: false
  end
end
