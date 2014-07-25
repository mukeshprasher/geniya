class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [ :new, :edit, :create, :update, :destroy]
  before_action only: [:edit, :update, :destroy] do
    redirect_with_notice_if_incorrect_user(@video)
  end

  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.all
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    @video = Video.find(params[:id])
    @user = @video.user
    impressionist @video, '', unique: [:user_id] if current_user
    @likers = @video.likers(User)
    @comments = @video.comment_threads.where('parent_id IS NULL').order('created_at desc')
    if signed_in?
      @new_comment = Comment.build_from(@video, current_user.id, "")
    end
  end

  # GET /videos/new
  def new
    if current_user.plan == 'trial'
      if current_user.videos.count>=3
        redirect_to current_user, notice: 'Please Upgrade Your Plan for Post more Videos.' 
      else
        @video = Video.new
      end
    else
      if current_user.plan == 'visitor'
        redirect_to current_user, notice: 'You Cannot Post Video.'
      else
        @video = Video.new
      end
    end
  end

  # GET /videos/1/edit
  def edit
  end

  def geniya_videos
    @user = User.find(1)
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(video_params)
    @video.user_id = current_user.id
    if @video.save
      @update_upload = current_user.uploads.build(video_params1)
      @update_upload.save
    end
#    respond_to do |format|
#      if @video.save
#        format.html { redirect_to @video, notice: 'Video was successfully created.' }
#        format.json { render action: 'show', status: :created, location: @video }
#      else
#        format.html { render action: 'new' }
#        format.json { render json: @video.errors, status: :unprocessable_entity }
#      end
#    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to videos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:name, :file_attachment)
    end
    def video_params1
      params.require(:video).permit(:file_attachment)
    end    
end
