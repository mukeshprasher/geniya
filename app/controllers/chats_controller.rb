class ChatsController < ApplicationController
  before_action :set_chat, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:index, :show, :new, :edit, :create, :update, :destroy]
  before_action only: [:edit, :update, :destroy] do
    redirect_with_notice_if_incorrect_user(@chat)
  end

  # GET /chats
  # GET /chats.json
  def index
    @chats = Chat.where("reciever_id = ? OR user_id = ?", current_user.id, current_user.id).order('created_at DESC')
  end

  # GET /chats/1
  # GET /chats/1.json
  def show
    @other_user = (@chat.user == current_user) ? @chat.reciever : @chat.user

    Chat.where(reciever_id: current_user.id, user_id: @other_user.id, status: 'unread').each do |chat|
      chat.update_attribute(:status, 'read')
    end

    @chats = Chat.where("(reciever_id = ? AND user_id = ?) OR (reciever_id = ? AND user_id = ?)", @other_user.id, current_user.id, current_user.id, @other_user.id).order('created_at DESC').limit(50).reverse
    @new_chat = Chat.new
  end

  # GET /chats/new
  def new
    @chat = Chat.new
  end

  # GET /chats/1/edit
  def edit
  end

  # POST /chats
  # POST /chats.json
  def create
    @chat = Chat.new(chat_params)
    unless @chat.errors.any?
      @chat.message = process_chat_message(chat_params[:message])
      @chat.user_id = current_user.id
      @chat.save
    end
    @reciever_id = @chat.reciever_id
    
    @chats = Chat.where("id > ? AND ((reciever_id = ? AND user_id = ?) OR (reciever_id = ? AND user_id = ?))", params[:last_msg_id].to_i, @reciever_id, current_user.id, current_user.id, @reciever_id).order('created_at ASC')
    @last_msg_id = @chats.last.id
#    respond_to do |format|
#      if @chat.save
#        format.html { redirect_to @chat, notice: 'Chat was successfully created.' }
#        format.json { render action: 'show', status: :created, location: @chat }
#      else
#        format.html { render action: 'new' }
#        format.json { render json: @chat.errors, status: :unprocessable_entity }
#      end
#    end
  end

  # PATCH/PUT /chats/1
  # PATCH/PUT /chats/1.json
  def update
    respond_to do |format|
      if @chat.update(chat_params)
        format.html { redirect_to @chat, notice: 'Chat was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chats/1
  # DELETE /chats/1.json
  def destroy
    @chat.destroy
#    respond_to do |format|
#      format.html { redirect_to chats_url }
#      format.json { head :no_content }
#    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat
      @chat = Chat.find(params[:id])
    end

    def process_chat_message(message)
      message
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chat_params
      params.require(:chat).permit(:user_id, :reciever_id, :message, :status, :last_msg_id)
    end
end
