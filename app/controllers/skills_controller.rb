class SkillsController < ApplicationController
  before_action :set_skill, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [ :new, :create, :edit, :update, :destroy]

  # GET /skills
  # GET /skills.json
  def index
    @skills = Skill.all
  end

  # GET /skills/1
  # GET /skills/1.json
  def show
  end

  # GET /skills/new
  def new
    @skill = Skill.new
  end

  # GET /skills/1/edit
  def edit
  end

  # POST /skills
  # POST /skills.json
  def create
    @user = current_user
    
    skills = process_skills(params[:skill][:name])
    skills.each do |skill_name|
      searched_skill = Skill.find_by(name: skill_name)
      skill = (searched_skill) ? searched_skill : Skill.new(name: skill_name)
      skill.users << current_user unless skill.users.include? current_user
      skill.save
    end
  end

  # PATCH/PUT /skills/1
  # PATCH/PUT /skills/1.json
  def update
    respond_to do |format|
      if @skill.update(skill_params)
        format.html { redirect_to @skill, notice: 'Skill was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skills/1
  # DELETE /skills/1.json
  def destroy
    @skill.destroy
    respond_to do |format|
      format.html { redirect_to skills_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skill
      @skill = Skill.find(params[:id])
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
    def skill_params
      params.require(:skill).permit(:name)
    end
end
