class FeedbacksController < ApplicationController
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]
  before_action :show_feedbacks, only: [:index]
  # GET /feedbacks
  # GET /feedbacks.json
  def index
    @feedbacks = Feedback.all
    if params[:q]
      @feedbacks = Feedback.where("lower(name) like lower(?)", "%#{params[:q]}%")
    else  
      @feedbacks = Feedback.paginate(page: params[:page], :per_page => 20)
    end    
  end

  # GET /feedbacks/1
  # GET /feedbacks/1.json
  def show
  end

  # GET /feedbacks/new
  def new
    @feedback = Feedback.new
  end

  # GET /feedbacks/1/edit
  def edit
  end

  # POST /feedbacks
  # POST /feedbacks.json
  def create
    @feedback = Feedback.new(feedback_params)
    if signed_in?
      @feedback.user_id = current_user.id
    end
    respond_to do |format|
      if @feedback.save
        if(UserMailer.feedback_request(@feedback).deliver)
  #        flash[:success] = "Your Request is send for Quote."
        else
          flash[:error] = "Error sending email."
        end         
        format.html { redirect_to @feedback, notice: "Thanks, we'll get back to you shortly." }
        format.json { render action: 'show', status: :created, location: @feedback }
      else
        format.html { render action: 'new' }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feedbacks/1
  # PATCH/PUT /feedbacks/1.json
  def update
    respond_to do |format|
      if @feedback.update(feedback_params)
        format.html { redirect_to @feedback, notice: 'Feedback was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedbacks/1
  # DELETE /feedbacks/1.json
  def destroy
    @feedback.destroy
    respond_to do |format|
      format.html { redirect_to feedbacks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feedback
      @feedback = Feedback.find(params[:id])
    end

    def show_feedbacks
      if !signed_in?
        redirect_to(root_url)
      else
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feedback_params
      params.require(:feedback).permit(:parent_id, :user_id, :email, :kind, :subject, :description, :priority, :status)
    end
end
