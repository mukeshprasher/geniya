class AlbumsController < ApplicationController
  before_action :set_album, only: [:show]
  before_action :signed_in_user, except: [:index, :show]
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
    end
  end

  # GET /albums/new
  def new
    @album = Album.new
  end

  # GET /albums/1/edit
  def edit
  end

  # POST /albums
  # POST /albums.json
  def create
    @album = Album.new(album_params)
    respond_to do |format|
      if @album.save
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
    @album.destroy
    destroy_activity(@album.class.name, @album.id, 'create')
    respond_to do |format|
      format.html { redirect_to albums_url }
      format.json { head :no_content }
    end
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
