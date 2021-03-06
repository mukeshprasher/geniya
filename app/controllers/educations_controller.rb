class EducationsController < ApplicationController
  before_action :set_education, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [ :index, :new, :edit, :create, :update, :destroy]
  before_action only: [:edit, :update, :destroy] do
    redirect_with_notice_if_incorrect_user(@education)
  end
  before_action :can_edit, only: [:show, :create]
  # GET /educations
  # GET /educations.json
  def index
    @educations = Education.all
  end

  # GET /educations/1
  # GET /educations/1.json
  def show
  end

  # GET /educations/new
  def new
    @education = Education.new
  end

  # GET /educations/1/edit
  def edit
  end

  # POST /educations
  # POST /educations.json
  def create
    @education = Education.new(education_params)
    @education.user_id =  current_user.id
    @education.save
#    respond_to do |format|
#      if @education.save
#        format.html { redirect_to @education, notice: 'Education was successfully created.' }
#        format.json { render action: 'show', status: :created, location: @education }
#      else
#        format.html { render action: 'new' }
#        format.json { render json: @education.errors, status: :unprocessable_entity }
#      end
#    end
  end

  # PATCH/PUT /educations/1
  # PATCH/PUT /educations/1.json
  def update
    respond_to do |format|
      if @education.update(education_params)
        format.html { redirect_to @education, notice: 'Education was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @education.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /educations/1
  # DELETE /educations/1.json
  def destroy
    @education.destroy
#    respond_to do |format|
#      format.html { redirect_to educations_url }
#      format.json { head :no_content }
#    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_education
      @education = Education.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def education_params
      params.require(:education).permit(:institute_name, :course_name, :start_date, :end_date)
    end

    def can_edit
      @can_edit = (current_user)
    end         
    
end
