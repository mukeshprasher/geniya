class FeedbackRepliesController < ApplicationController
  before_action :set_feedback_reply, only: [:show, :edit, :update, :destroy]

  # GET /feedback_replies
  # GET /feedback_replies.json
  def index
    @feedback_replies = FeedbackReply.all
  end

  # GET /feedback_replies/1
  # GET /feedback_replies/1.json
  def show
  end

  # GET /feedback_replies/new
  def new
    @feedback_reply = FeedbackReply.new
  end

  # GET /feedback_replies/1/edit
  def edit
  end

  # POST /feedback_replies
  # POST /feedback_replies.json
  def create
    @feedback_reply = FeedbackReply.new(feedback_reply_params)

    respond_to do |format|
      if @feedback_reply.save
        format.html { redirect_to @feedback_reply, notice: 'Feedback reply was successfully created.' }
        format.json { render action: 'show', status: :created, location: @feedback_reply }
      else
        format.html { render action: 'new' }
        format.json { render json: @feedback_reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feedback_replies/1
  # PATCH/PUT /feedback_replies/1.json
  def update
    respond_to do |format|
      if @feedback_reply.update(feedback_reply_params)
        format.html { redirect_to @feedback_reply, notice: 'Feedback reply was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @feedback_reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedback_replies/1
  # DELETE /feedback_replies/1.json
  def destroy
    @feedback_reply.destroy
    respond_to do |format|
      format.html { redirect_to feedback_replies_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feedback_reply
      @feedback_reply = FeedbackReply.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feedback_reply_params
      params.require(:feedback_reply).permit(:parent_id, :user_id, :message)
    end
end
