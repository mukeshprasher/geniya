class MultiuploadsController < ApplicationController
  before_action :set_multiupload, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [ :new, :edit, :create, :update, :destroy]
  before_action only: [:edit, :update, :destroy] do
    redirect_with_notice_if_incorrect_user(@multiupload)
  end

  # GET /multiuploads
  # GET /multiuploads.json
#  def index
#    @multiuploads = Multiupload.all
#  end

  def index
    if params.has_key?(:album_id)
      album = Album.find(params[:album_id])
      @multiuploads = album.multiuploads
    else
      @multiuploads = Multiupload.all
    end

    respond_to do |format|
      format.html # index.html.haml
      format.json { render json: @multiuploads.map{|multiupload| multiupload.to_jq_upload } }
    end
  end


  # GET /multiuploads/1
  # GET /multiuploads/1.json
#  def show
#  end
  
  
  
  def show
    @multiupload = Multiupload.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @multiupload }
    end
  end
  
  # GET /multiuploads/new
#  def new
#    @multiupload = Multiupload.new
#  end
#  
  
  def new
    @multiupload = Multiupload.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @multiupload  }
    end
  end
  # GET /multiuploads/1/edit
#  def edit
#  end
#  
  def edit
    @multiupload = Multiupload.find(params[:id])
  end
  
  
  # POST /multiuploads
  # POST /multiuploads.json
#  def create
#    @multiupload = Multiupload.new(multiupload_params)

#    respond_to do |format|
#      if @multiupload.save
#        format.html { redirect_to @multiupload, notice: 'Multiupload was successfully created.' }
#        format.json { render action: 'show', status: :created, location: @multiupload }
#      else
#        format.html { render action: 'new' }
#        format.json { render json: @multiupload.errors, status: :unprocessable_entity }
#      end
#    end
#  end



 def create
    @multiupload = Multiupload.new(multiupload_params)
    respond_to do |format|
      if @multiupload.save
        format.html {
          render :json => [@multiupload.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json { render json: {files: [@multiupload.to_jq_upload]}, status: :created, location: @multiupload }
      else
        format.html { render action: "new" }
        format.json { render json: @multiupload.errors, status: :unprocessable_entity }
      end
    end
  end




  # PATCH/PUT /multiuploads/1
  # PATCH/PUT /multiuploads/1.json
#  def update
#    respond_to do |format|
#      if @multiupload.update(multiupload_params)
#        format.html { redirect_to @multiupload, notice: 'Multiupload was successfully updated.' }
#        format.json { head :no_content }
#      else
#        format.html { render action: 'edit' }
#        format.json { render json: @multiupload.errors, status: :unprocessable_entity }
#      end
#    end
#  end



 def update
    @multiupload = Multiupload.find(params[:id])

    respond_to do |format|
      if @multiupload.update_attributes(params[:multiupload])
        format.html { redirect_to @multiupload, notice: 'Upload was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @multiupload.errors, status: :unprocessable_entity }
      end
    end
  end









  # DELETE /multiuploads/1
  # DELETE /multiuploads/1.json
#  def destroy
#    @multiupload.destroy
#    respond_to do |format|
#      format.html { redirect_to multiuploads_url }
#      format.json { head :no_content }
#    end
#  end

  def destroy
    @multiupload = Multiupload.find(params[:id])
    @multiupload.destroy

    respond_to do |format|
      format.html { redirect_to multiuploads_url }
      format.json { head :no_content }
    end
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_multiupload
      @multiupload = Multiupload.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def multiupload_params
      params.require(:multiupload).permit(:multiupload, :user_id, :multiupload_file_title, :multiupload_file_desc, :album_id)
    end
end
