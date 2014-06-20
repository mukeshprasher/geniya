class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :profile_edit]
  before_action :signed_in_user, only: [ :edit, :update, :destroy, :following, :followers, :profile_edit]
  before_action :correct_user,   only: [:edit, :update, :profile_edit]
  before_action :admin_user,     only: :destroy
  before_action :redirect_if_already_signed_in, only: [:new, :create]
  before_action :can_edit, only: [:show]
  before_action :show_users, only: [:index]
  
  def index
    if params[:q]
      @users = User.where("lower(name) like lower(?)", "%#{params[:q]}%")
    else  
      @users = User.paginate(page: params[:page])
    end
  end

  def show
    if signed_in?
      @updates = @user.updates.paginate(page: params[:page], :per_page => 10)
      @headshot = Upload.new
      @covershot = Cover.new
      @featureimg = Featureimg.new
      @new_chat = Chat.new
      #impressionist @user, '', unique: [:user_id] if current_user
      @skill = current_user.skills.build
      @education = current_user.educations.build
      @advertisement = current_user.advertisements.build
      @album = current_user.albums.build
      @upload = current_user.uploads.build
      @affiliation = current_user.affiliations.build
      @organization = current_user.organizations.build
      @tag = current_user.tags.build
      @location = current_user.locations.build
    end
  end

  def new
    @user = User.new
    if (['trial', 'deluxe', 'visitor'].include?(params[:plan]))
      @plan = params[:plan]
    else
      @plan = 'trial'
    end
  end

  def profile_edit
  end  
  
  
  def edit
  end

  def create
    @user = User.new(user_params)
    if (['trial', 'deluxe', 'visitor'].include?(params[:user][:plan]))
      @user.plan = params[:user][:plan]
    else
      @user.plan = 'trial'
    end
    
    @plan = @user.plan
    @user.plan_end = Date.today + 1.month
    @user.status = "active"
    respond_to do |format|
      if @user.save
#        set_sub_categories
        default_album = @user.albums.build(name: "Default Album", category_id: params[:user][:category_id], title: "Profile picture and timeline uploads", description: "The pictues which dont belong to any album go here", kind: "default")
        default_album.save
        
        status_pic_album = @user.albums.build(name: "Status Pictures Album", category_id: params[:user][:category_id], title: "Status and timeline uploads", description: "Status and timelines pictures go here", kind: "status")
        status_pic_album.save
        
        cover_pic_album = @user.albums.build(name: "Cover Pictures Album", category_id: params[:user][:category_id], title: "Cover Pictures uploads", description: "Cover pictures go here", kind: "cover")
        cover_pic_album.save
        
        profile_pic_album = @user.albums.build(name: "Profile Pictures Album",category_id: params[:user][:category_id], title: "Profile Pictures uploads", description: " pictures go here", kind: "profile")
        status_pic_album.save                
                
        format.html {
            sign_in @user
            flash[:success] = "Welcome to Geniya!, tell us something more about you." 
            redirect_to edit_user_path(@user)
        }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        set_sub_categories unless params[:sub_category_ids].nil?
        format.html {
          flash[:success] = "Profile updated"
          redirect_to @user
        }
        format.json { head :no_content }
      else
        format.html { render action: 'profile_edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

#    def set_sub_categories
#      params[:user][:sub_category_ids].each do |sub_category_id|
#        UserSubCategory.create!(sub_category_id: sub_category_id, user_id: @user.id) if sub_category_id != ''
#      end      
#    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:category_id, :sub_category_id, :email, :username, :tag, :password, :password_confirmation, :name, :gender, :summary, :height, :bust, :hips, :shoes, :hair, :eyes, :birthdate, :available, :feature_img)
    end

    # Before filters
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def redirect_if_already_signed_in
      redirect_to(root_url) if signed_in? 
    end

    def show_users
      if !signed_in?
        redirect_to(root_url)
      else
        if current_user.plan == "admin"
        else
          redirect_to(root_url)
        end
      end
    end

    def can_edit
      @can_edit = (current_user and current_user?(@user))
    end
end
