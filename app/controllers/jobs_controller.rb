class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [ :new, :create, :edit, :update, :destroy]
  before_action only: [:edit, :update, :destroy] do
    redirect_with_notice_if_incorrect_user(@job)
  end

  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = Job.all
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    if current_user.plan == "trial"
      redirect_to current_user, :alert => "Please Upgrade your Plan to Deluxe for Post Jobs." 
    else
      redirect_to new_organization_path, notice: 'Please create an organization to create a job.' unless current_user.organizations.any?
      @job = Job.new
    end
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)
    @job.user_id = current_user.id

    respond_to do |format|
      if @job.save
        skills = process_skills(params[:job][:skills_text])
        skills.each do |skill_name|
          searched_skill = Skill.find_by(name: skill_name)
          skill = (searched_skill) ? searched_skill : Skill.new(name: skill_name)
          skill.jobs << @job unless skill.jobs.include? @job
          skill.save
        end

        format.html { 
          if job_params.has_key?(:cover)
            render 'crop'  
          else
            redirect_to @job, notice: 'Job was successfully created.'
          end    
        }
        
        format.json { render action: 'show', status: :created, location: @job }
        
#        if(job_params[:job].has_key?(:cover))
#          render 'crop'        
#        else
#          format.html { redirect_to @job, notice: 'Job was successfully created.' }
#          format.json { render action: 'show', status: :created, location: @job }        
#        end
      else
        format.html { render action: 'new' }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    if job_params.has_key?(:cover_original_w)
      #params[:job][:cover_box_w] = 1000
      if job_params[:cover_original_w].to_f > 1000
        scale_factor = job_params[:cover_original_w].to_f / 1000
        job_params[:cover_crop_x] = job_params[:cover_crop_x].to_f * scale_factor
        job_params[:cover_crop_y] = job_params[:cover_crop_y].to_f * scale_factor
        job_params[:cover_crop_w] = job_params[:cover_crop_w].to_f * scale_factor
        job_params[:cover_crop_h] = job_params[:cover_crop_h].to_f * scale_factor
      end
    end


    respond_to do |format|
      if @job.update(job_params)
        if params[:job][:skills_text].present?
          @job.job_skills.each {|job_skill| job_skill.destroy} if @job.job_skills.any?

          skills = process_skills(params[:job][:skills_text])

          skills.each do |skill_name|
            searched_skill = Skill.find_by(name: skill_name)
            skill = (searched_skill) ? searched_skill : Skill.new(name: skill_name)
            skill.jobs << @job unless skill.jobs.include? @job
            skill.save
          end
        end

        format.html { 
          if job_params.has_key?(:cover)
            render 'crop'  
          else        
            redirect_to @job, notice: 'Job was successfully updated.' 
          end  
        }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    def correct_user
      redirect_to(root_url) unless current_user?(@job.user)
    end

    def process_skills(text)
      sanitized_text = ActionController::Base.helpers.sanitize text
      
      skills = Array.new
      sanitized_text.split(/,/).each do |text|
        skill = text.strip.gsub(/[^0-9A-Za-z]/, ' ').downcase
        if skill.length > 0 and !skill.nil?
          skills << skill
        end
      end
      
      skills
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.fetch(:job, {}).permit!
      #params.require(:job).permit(:user_id, :organization_id, :category_id, :sub_category_id, :address_id, :reference_code, :title, :description, :minimum_experience, :maximum_experience, :minimum_salary, :maximum_salary, :employment_type, :employment_status, :cover)
    end
end
