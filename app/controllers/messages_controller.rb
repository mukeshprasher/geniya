class MessagesController < ApplicationController
  before_action :signed_in_user

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.build(message_params)
    @message.user_id = current_user.id
    @message.save!

    
    @path = user_path(current_user)

    reciever = interlocutor(@conversation)
    @path2 = user_path(reciever)
  end

  private

    def message_params
      params.require(:message).permit(:body)
    end
end
