class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [ :edit, :update, :destroy, :following, :followers]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  before_action :redirect_if_already_signed_in, only: [:new, :create]
  before_action :can_edit, only: [:show]
  
  def index
    if params[:q]
      @users = User.where("lower(name) like lower(?)", "%#{params[:q]}%")
    else  
      @users = User.paginate(page: params[:page])
    end
  end

  def show
    @updates = @user.updates.paginate(page: params[:page], :per_page => 10)
    @headshot = (@user.headshot) ? @user.headshot : Upload.new
    #impressionist @user, '', unique: [:user_id] if current_user
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    @user.plan = "trial"
    @user.plan_end = Date.today + 1.month
    @user.status = "active"
    respond_to do |format|
      if @user.save
#        set_sub_categories
        default_album = @user.albums.build(name: "Default Album", title: "Profile picture and timeline uploads", description: "The pictues which dont belong to any album go here", kind: "default")
        default_album.save
        
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
      params[:user][:tag] = sanitize_and_linkify_text(params[:user][:tag])
      if @user.update(user_params)
        set_sub_categories unless params[:sub_category_ids].nil?
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

#    def set_sub_categories
#      params[:user][:sub_category_ids].each do |sub_category_id|
#        UserSubCategory.create!(sub_category_id: sub_category_id, user_id: @user.id) if sub_category_id != ''
#      end      
#    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:category_id, :sub_category_id, :email, :username, :tag, :password, :password_confirmation, :name, :gender, :summary, :height, :bust, :hips, :shoes, :hair, :eyes, :birthdate, :available)
    end

    # Before filters
    def sanitize_and_linkify_text(text )
      sanitized_text = ActionController::Base.helpers.sanitize text
      mentioned_text = text.split.map do |word| 
        if /^#.+/.match word
          if tag = Tag.find_by_tag_name(word[1..-1])
            src = tag_url(tag)
            word = "<a href='#{src}'>#{word[1..-1]}</a>"
          else
            tag = Tag.create!(tag_name: word[1..-1] , user_id: current_user.id)
            src = tag_url(tag)
            word = "<a href='#{src}'>#{word[1..-1]}</a>"
          end
        end
      end
      mentioned_text.join(' ')
    end 
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def redirect_if_already_signed_in
      redirect_to(root_url) if signed_in? 
    end

    def can_edit
      @can_edit = (current_user and current_user?(@user))
    end
end
