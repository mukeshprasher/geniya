class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [ :edit, :update, :destroy, :following, :followers]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  before_action :redirect_if_already_signed_in, only: [:new, :create]
  
  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @updates = @user.updates.paginate(page: params[:page], :per_page => 10)
    @headshot = (@user.headshot) ? @user.headshot : Upload.new
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        set_sub_categories
        default_album = @user.albums.build(name: "Default Album", title: "Profile picture and timeline uploads", description: "The pictues which dont belong to any album go here", kind: "default")
        default_album.save
        
        format.html {
            sign_in @user
            flash[:success] = "Welcome to Geniya!" 
            redirect_to @user
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
        set_sub_categories
        format.html {
          flash[:success] = "Profile updated"
          redirect_to @user
        }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
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

    def set_sub_categories
      params[:user][:sub_category_ids].each do |sub_category_id|
        UserSubCategory.create!(sub_category_id: sub_category_id, user_id: @user.id) if sub_category_id != ''
      end      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:sub_category_ids, :email, :username, :password, :password_confirmation, :name, :gender, :summary, :height, :bust, :hips, :shoes, :hair, :eyes, :birthdate, :available, :plan, :plan_end, :status)
    end

    # Before filters

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def redirect_if_already_signed_in
      redirect_to(root_url) if signed_in? 
    end
end
