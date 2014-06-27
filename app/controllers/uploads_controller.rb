class UploadsController < ApplicationController
  before_action :set_upload, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, except: [ :index, :show]
  before_action :correct_user,   only: [:edit, :update, :destroy]
  before_action :admin_user,     only: :index

  # GET /uploads
  # GET /uploads.json
  def index
    @uploads = Upload.all
  end

  # GET /uploads/1
  # GET /uploads/1.json
  def show
    impressionist @upload, '', unique: [:user_id] if current_user
  end

  # GET /uploads/new
  def new
    @upload = Upload.new
  end

  # GET /uploads/1/edit
  def edit
  end

  # POST /uploads
  # POST /uploads.json
  def create
#    @upload = Upload.new(upload_params)
#    @upload.user_id = current_user.id
#    @upload.save
    if params[:upload][:special_attribute] == 'headshot'
      @current_user_profile_pics = current_user.uploads.where(upload_type: 'profile')
      @current_user_profile_pics.each do |s|
        if s.special_attribute == 'headshot'
          s.update_attribute(:special_attribute, '')
          s.save
        end
      end
    elsif params[:upload][:special_attribute] == 'covershot'
      @current_user_profile_pics = current_user.uploads.where(upload_type: 'cover')
      @current_user_profile_pics.each do |s|
        if s.special_attribute == 'covershot'
          s.update_attribute(:special_attribute, '')
          s.save
        end
      end    
    end
    
    @upload = Upload.new(upload_params)
    @upload.user_id = current_user.id
    @upload.save

    render 'crop' 
#    respond_to do |format|
#      if @upload.save
#        format.html { redirect_to @upload, notice: 'Upload was successfully created.' }
#        format.json { render action: 'show', status: :created, location: @upload }
#      else
#        format.html { render action: 'new' }
#        format.json { render json: @upload.errors, status: :unprocessable_entity }
#      end
#    end
  end

  # PATCH/PUT /uploads/1
  # PATCH/PUT /uploads/1.json
  def update
#    @upload = Upload.find(params[:id])
#    @upload.update!(upload_params)
    if upload_params.has_key?(:file_attachment_original_w)
      #params[:file_attachment][:cover_box_w] = 1000
      if upload_params[:file_attachment_original_w].to_f > 1000
        scale_factor = upload_params[:file_attachment_original_w].to_f / 1000
        upload_params[:file_attachment_crop_x] = upload_params[:file_attachment_crop_x].to_f * scale_factor
        upload_params[:file_attachment_crop_y] = upload_params[:file_attachment_crop_y].to_f * scale_factor
        upload_params[:file_attachment_crop_w] = upload_params[:file_attachment_crop_w].to_f * scale_factor
        upload_params[:file_attachment_crop_h] = upload_params[:file_attachment_crop_h].to_f * scale_factor
      end
    end

    respond_to do |format|
      if @upload.update_attributes(upload_params)
        format.html { redirect_to current_user}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  def crop
    @upload = Upload.find(params[:id])
  end



  # DELETE /uploads/1
  # DELETE /uploads/1.json
  def destroy
#    @upload = Upload.find(params[:id])
    if @upload.destroy
      render :json => @upload, :status => :ok
    else
      render :js => "alert('error deleting Image');"
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upload
      @upload = Upload.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def upload_params
      params.fetch(:upload, {}).permit!
#      params.require(:upload).permit(:upload_type, :album_id, :name, :title, :description, :file_attachment, :special_attribute)
    end

    # Before filters
    def correct_user
      @upload = current_user.uploads.find(params[:id])
    rescue
      redirect_to root_url
    end
end
