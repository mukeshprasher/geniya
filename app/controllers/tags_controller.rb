class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  # GET /tags
  # GET /tags.json
  def index
    if params[:q]
      @tags = Tag.where("lower(name) like lower(?)", "%#{params[:q]}%")
    else  
      @tags = Tag.paginate(page: params[:page])
    end
  end

  # GET /tags/1
  # GET /tags/1.json
  def show
    @users = @tag.users.paginate(page: params[:page])
  end

  # GET /tags/new
  def new
    @tag = Tag.new
  end

  # GET /tags/1/edit
  def edit
  end

  # POST /tags
  # POST /tags.json
  def create
    tags = process_tags(params[:tag][:name])
    tags.each do |tag_name|
      searched_tag = Tag.find_by(name: tag_name)
      tag = (searched_tag) ? searched_tag : Tag.new(name: tag_name)
      tag.users << current_user unless tag.users.include? current_user
      tag.save
    end
  end

  # PATCH/PUT /tags/1
  # PATCH/PUT /tags/1.json
  def update
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to @tag, notice: 'Tag was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tags/1
  # DELETE /tags/1.json
  def destroy
    @tag.destroy
    respond_to do |format|
      format.html { redirect_to tags_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_params
      params.require(:tag).permit(:name)
    end

    def process_tags(text)
      sanitized_text = ActionController::Base.helpers.sanitize text
      
      tags = Array.new
      sanitized_text.split(/,/).each do |text|
        tag = text.strip.gsub(' ','_')
        if tag.length > 0 and !tag.nil?
          tags << tag
        end
      end
      
      tags
    end
end
