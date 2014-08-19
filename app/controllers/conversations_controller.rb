class ConversationsController < ApplicationController
  before_action :signed_in_user
  layout false

  def index
    @conversations = Conversation.involving(current_user)
    @connected_users = current_user.confirmed_connected_users
  end
 
  def create
    if Conversation.between(params[:sender_id],params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id],params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end
   
    render json: { conversation_id: @conversation.id }
  end
   
  def show
    @conversation = Conversation.find(params[:id])
    @reciever = interlocutor(@conversation)
    @messages = @conversation.messages
    @messages.where(status: 'unread', recipient_id: current_user.id).each do |msg|
      msg.status = 'read'
      msg.save
    end
    
    @message = Message.new
  end
   
  private
    def conversation_params
      params.permit(:sender_id, :recipient_id)
    end
     
end
