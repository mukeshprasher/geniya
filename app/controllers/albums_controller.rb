class AlbumsController < ApplicationController
  before_action :set_album, only: [:show]
  before_action :signed_in_user, except: [:show]
  before_action :admin_user, only: [:index]
  before_action :correct_user,   only: [:edit, :update, :destroy]

  # GET /albums
  # GET /albums.json
  def index
    @albums = Album.where(:kind => "portfolio")
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
    if signed_in?
      @upload = current_user.uploads.build
    end
    @album = Album.find(params[:id])
    @user = @album.user
    @user_profile_pics = @user.uploads.where(upload_type: 'profile')
    impressionist @album, '', unique: [:user_id] if current_user
    @likers = @album.likers(User)
    @comments = @album.comment_threads.where('parent_id IS NULL').order('created_at desc')
    if signed_in?
      @new_comment = Comment.build_from(@album, current_user.id, "")
      @video = current_user.videos.build
    end
  end

  # GET /albums/new
  def new
    if current_user.plan == 'trial'
      if current_user.albums.count>=7
        redirect_to new_payment_subscription_path, notice: 'Please upgrade your plan to create more portfolios.' 
      else
        @album = Album.new
      end
    else
      if current_user.plan == 'visitor'
        redirect_to current_user, notice: 'You cannot create portfolios.'
      else
        @album = Album.new
      end
    end
  end

  # GET /albums/1/edit
  def edit
  end

  # POST /albums
  # POST /albums.json
  def create
    @album = Album.new(album_params)
    @album.user_id = current_user.id
    respond_to do |format|
      if @album.save
        if @album.user.locations.any?
          add_location_to_user_albums(@album.user.locations.where(status: 'current').first) if @album.user.locations.where(status: 'current').any?
        end
        create_activity(@album.class.name, @album.id, 'create')
        format.html { render action: 'crop' }
      else
        format.html { render action: 'new' }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /albums/1
  # PATCH/PUT /albums/1.json
  def update
    respond_to do |format|
      if album_params.has_key?(:cover_original_w)
        #params[:album][:cover_box_w] = 1000
        if album_params[:cover_original_w].to_f > 1000
          scale_factor = album_params[:cover_original_w].to_f / 1000
          album_params[:cover_crop_x] = album_params[:cover_crop_x].to_f * scale_factor
          album_params[:cover_crop_y] = album_params[:cover_crop_y].to_f * scale_factor
          album_params[:cover_crop_w] = album_params[:cover_crop_w].to_f * scale_factor
          album_params[:cover_crop_h] = album_params[:cover_crop_h].to_f * scale_factor
        end
      end

      if @album.update_attributes(album_params)
        format.html {           
          if album_params.has_key?(:cover)
            render 'crop'  
          else        
            redirect_to @album, notice: 'Album was successfully posted.' 
          end 
        }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    @album.multiuploads.each do |multiupload|
      multiupload.destroy
    end
    
    destroy_all_comments_likes_activities_and_responses_of_obj(@album)
  # destroy responses
#    Response.where(acted_upon_type: "Album", acted_upon_id: @album.id).each do |album_response|
#      album_response.destroy
#    end
#  #destroy activities
#    Activity.where(acted_upon_type: "Album", acted_upon_id: @album.id).each do |album_activity|
#      album_activity.destroy
#    end  
  #destroy comments
#    Comment.where(commentable_type: 'Album', commentable_id: @album.id).each do |album_comment|
#      Like.where(likeable_type: 'Comment', likeable_id: album_comment.id).each do |comment_likes|
#        comment_likes.destroy
#      end

#      Response.where(acted_upon_type: "Comment", acted_upon_id: album_comment.id).each do |comment_response|
#        comment_response.destroy
#      end      
#      
#      if album_comment.has_children?
#        album_comment.children.each do |child|
#          child.destroy
#        end
#      end

#      album_comment.destroy
#    end
  
  #destroy likes
#    Like.where(likeable_type: 'Album', likeable_id: @album.id).each do |album_likes|
#      album_likes.destroy
#    end  
#    destroy_activity(@album.class.name, @album.id, 'create')
#    destroy_activity(@album.class.name, @album.id, 'like')
    @album.destroy
#    respond_to do |format|
#      format.html { redirect_to albums_url }
#      format.json { head :no_content }
#    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_params
      params.fetch(:album, {}).permit!
#      params.require(:album).permit(:user_id, :name, :title, :description, :kind, :category_id)
    end

    # Before filters
    def correct_user
      @album = current_user.albums.find(params[:id])
    rescue
      redirect_to root_url
    end
end
