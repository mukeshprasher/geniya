class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :profile_edit, :change_password, :change_login]
  before_action :signed_in_user, only: [ :edit, :update, :destroy, :following, :followers, :profile_edit]
  before_action :correct_user,   only: [:edit, :update, :profile_edit]
  before_action :admin_user,     only: :destroy
  before_action :redirect_if_already_signed_in, only: [:new, :create]
  before_action :can_edit, only: [:show]
#  before_action :show_users, only: [:index]
  
  def index
    if params[:q]
      @users = User.where("lower(name) like lower(?)", "%#{params[:q]}%")
    else  
      @users = User.paginate(page: params[:page], :per_page => 10)
    end
  end

  def show
    if signed_in?
      if params[:auth].present?
        flash.now[:notice] = "It may take a while to process payments."
      end
      @updates = @user.updates.paginate(page: params[:page], :per_page => 10)
      @headshot = Upload.new
      @covershot = Cover.new
      @featureimg = Featureimg.new
      @new_chat = Chat.new
      @event = Event.new
      impressionist @user, '', unique: [:user_id] if current_user
      @skill = current_user.skills.build
      @education = current_user.educations.build
      @advertisement = current_user.advertisements.build
      @album = current_user.albums.build
      @upload = current_user.uploads.build
      @affiliation = current_user.affiliations.build
      @organization = current_user.organizations.build
      @tag = current_user.tags.build
      @location = current_user.locations.build
      @activities = Activity.where(user_id: @user.id).paginate(page: params[:page], per_page: 15).order(created_at: :desc)
    end

    @advertisements =@user.advertisements.limit(1).offset rand @user.advertisements.count
    @jobs =@user.jobs.limit(1).offset rand @user.jobs.count

    @quote = @user.quotes.build
#    @jobs = Array.new
#    @user.skills.each {|skill| skill.jobs.each{|job| @jobs << job } }
#    @jobs = @jobs.uniq
  end

  def new
    @user = User.new
    if (['trial', 'deluxe', 'visitor'].include?(params[:plan]))
      @plan = params[:plan]
    else
      @plan = 'trial'
    end
  end

  def bussiness
    @user = User.new
  end


  def profile_edit
  end  
  
  def forgot_password
  end

  def recover_password
    @user = User.find_by_email(user_params[:email])
    if !@user.nil?
      @user.change_password_code = ('a'..'z').to_a.shuffle[0..19].join
      @user.save(:validate => false)
      
      if(UserMailer.recover_password(@user).deliver)
        flash[:success] = "Please check your email to recover password."
      else
        flash[:error] = "Error sending email."
      end
    else
      flash[:error] = "Wrong email entered."
    end
    
    redirect_to new_session_path
  end

  def get_quote
    
  end





  def change_password
    if params.has_key?(:a) and params[:a].present?
      if @user.change_password_code == params[:a]
        sign_in @user
      else
        flash[:error] = "Wrong link"
        redirect_to new_session_path
      end
    else
      flash[:error] = "Unauthorized action"
      redirect_to new_session_path
    end
  end
 
  def change_login
    if @user.parent_id == current_user.id || @user.id == current_user.parent_id || @user.parent_id == current_user.parent_id
      sign_in @user
      redirect_to @user
    else
      redirect_to current_user
    end
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

    @user.chosen_plan = @user.plan
    @plan = @user.plan
    
#    @user.plan = 'trial' if @user.plan == 'deluxe'
    
    @user.plan_end = Date.today + 1.month
    @user.status = ('a'..'z').to_a.shuffle[0..19].join
    respond_to do |format|
      if @user.save
#        set_sub_categories
        default_album = @user.albums.build(name: "Default Album", category_id: @user.category_id, sub_category_id: @user.sub_category_id, title: "Profile picture and timeline uploads", description: "The pictues which dont belong to any album go here", kind: "default")
        default_album.save validate: false
        
        status_pic_album = @user.albums.build(name: "Status Pictures Album", category_id: @user.category_id, sub_category_id: @user.sub_category_id, title: "Status and timeline uploads", description: "Status and timelines pictures go here", kind: "status")
        status_pic_album.save validate: false
        
        cover_pic_album = @user.albums.build(name: "Cover Pictures Album", category_id: @user.category_id, sub_category_id: @user.sub_category_id, title: "Cover Pictures uploads", description: "Cover pictures go here", kind: "cover")
        cover_pic_album.save validate: false
        
        profile_pic_album = @user.albums.build(name: "Profile Pictures Album", category_id: @user.category_id, sub_category_id: @user.sub_category_id, title: "Profile Pictures uploads", description: " pictures go here", kind: "profile")
        profile_pic_album.save validate: false                
                
        format.html {
            #sign_in @user
            
            flash[:notice] = "Please check your email for activation link."
            UserMailer.activation_email(@user).deliver 
            redirect_to new_session_path
            #redirect_to edit_user_path(@user)
        }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  def create_bussiness
    params[:user][:category_id] = current_user.category_id
    params[:user][:sub_category_id] = current_user.sub_category_id
    params[:user][:chosen_plan] = current_user.plan
    params[:user][:password]  = "password"
    params[:user][:password_confirmation] = "password"
    params[:user][:kind] = "bussiness"
    params[:user][:parent_id] = current_user.id
    @user = User.new(user_params)
    @user.plan = current_user.plan
    @user.plan_end = Date.today + 1.month
    @user.email = @user.username+"@geniya.com"
    @user.status = "active"
    respond_to do |format|
      if @user.save
#        set_sub_categories
#        set_sub_categories
        default_album = @user.albums.build(name: "Default Album", category_id: @user.category_id, sub_category_id: @user.sub_category_id, title: "Profile picture and timeline uploads", description: "The pictues which dont belong to any album go here", kind: "default")
        default_album.save validate: false
        
        status_pic_album = @user.albums.build(name: "Status Pictures Album", category_id: @user.category_id, sub_category_id: @user.sub_category_id, title: "Status and timeline uploads", description: "Status and timelines pictures go here", kind: "status")
        status_pic_album.save validate: false
        
        cover_pic_album = @user.albums.build(name: "Cover Pictures Album", category_id: @user.category_id, sub_category_id: @user.sub_category_id, title: "Cover Pictures uploads", description: "Cover pictures go here", kind: "cover")
        cover_pic_album.save validate: false
        
        profile_pic_album = @user.albums.build(name: "Profile Pictures Album", category_id: @user.category_id, sub_category_id: @user.sub_category_id, title: "Profile Pictures uploads", description: " pictures go here", kind: "profile")
        profile_pic_album.save validate: false  

        format.html {
            sign_in @user
            redirect_to @user
        }
        format.json { render action: 'show', status: :created, location: @user, notice: 'Bussiness Page successfully created.'  }
      else
        format.html { render action: 'bussiness' }
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
      params.require(:user).permit(:category_id, :sub_category_id, :chosen_plan, :email, :username, :tag, :password, :password_confirmation, :name, :gender, :summary, :height, :bust, :hips, :shoes, :hair, :eyes, :birthdate, :available, :feature_img, :kind, :parent_id)
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
