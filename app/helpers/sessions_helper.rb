module SessionsHelper
  def sign_in(user, permanent = false)
      remember_token = User.new_remember_token
      
      if permanent == true
        cookies.permanent[:remember_token] = remember_token
      else
        cookies[:remember_token] = remember_token
      end
      
      user.update_attribute(:remember_token, User.encrypt(remember_token))
      current_user = user
  end

  def signed_in?
      !current_user.nil?
  end

  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def current_user?(user)
    user == current_user
  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in to perform this action."
    end
  end

  def sign_out
    current_user.update_attribute(:remember_token,
                                  User.encrypt(User.new_remember_token))
    cookies.delete(:remember_token)
    current_user = nil
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url if request.get?
  end
  
  def admin_user
    redirect_to(root_url) unless !current_user.nil? && current_user.plan=='admin'  && !current_user?(@user)
  end
  
  def sanitize_and_linkify_text(text)
    sanitized_text = ActionController::Base.helpers.sanitize text
    mentioned_text = text.split(/ /).map do |word| 
      if /^@.+/.match word
        if user = User.find_by_username(word[1..-1])
          src = user_url(user)
          word = "<a href='#{src}'>#{word}</a>"
        else
          word
        end
      elsif /:.*:/.match word
        smiley_name = word[1..-2]
        src = (File.exist?("app/assets/images/smileys/#{smiley_name}.gif")) ? "/assets/smileys/#{smiley_name}.gif" : ((File.exist?("app/assets/images/smileys/#{smiley_name}.png")) ? "/assets/smileys/#{smiley_name}.png" : false)
        word = (src) ? "<img src='#{src}' title='#{smiley_name}' width='20px' />" : word
      elsif /^#.+/.match word
        if tag = Tag.find_by_name(word[1..-1])
          src = tag_url(tag)
          word = "<a href='#{src}'>#{word[1..-1]}</a>"
        else
          tag = Tag.create!(name: word[1..-1] , user_id: current_user.id)
          src = tag_url(tag)
          word = "<a href='#{src}'>#{word[1..-1]}</a>"
        end
      else
        word
      end
    end
    
    mentioned_text.join(' ')
  end
  
  def sanitize_and_linkify_text_company(text)
    sanitized_text = ActionController::Base.helpers.sanitize text
    if /^.+/.match text
      if org = Organization.find_by_name(text)
        word = "#{text}"
      else
        org = Organization.create!(name: text)
        word = "#{text}"
      end
    else
      text
    end
  end  
  def sanitize_and_linkify_text_designation(text)
    sanitized_text = ActionController::Base.helpers.sanitize text
    if /^.+/.match text
      if des = Designation.find_by_name(text)
        word = "#{text}"
      else
        des = Designation.create!(name: text)
        word = "#{text}"
      end
    else
      text
    end
  end    
  
  def create_activity(acted_upon_type, acted_upon_id, action, description = '')
    # Used in updates/create albums/create likes/create shares/create
    @activity = Activity.create!(acted_upon_type: acted_upon_type, acted_upon_id: acted_upon_id, action: action, user_id: current_user.id, description: description)
  end

  def destroy_activity(acted_upon_type, acted_upon_id, action)
    # Used in updates/destroy albums/create likes/create shares/create
    activity = Activity.find_by(acted_upon_type: acted_upon_type, acted_upon_id: acted_upon_id, user_id: current_user.id)
    activity.destroy unless activity.nil?
  end

  def destroy_all_comments_likes_activities_and_responses_of_obj(obj)
    # Used in albums/destoy
    activities = Activity.where(acted_upon_type: obj.class.name, acted_upon_id: obj.id)
    activities.each {|activity| activity.destroy } if activities.any?

    responses = Response.where(acted_upon_type: obj.class.name, acted_upon_id: obj.id)
    responses.each {|response| response.destroy } if responses.any?

    Like.where(likeable_type: obj.class.name, likeable_id: obj.id).each do |like|
      like.destroy
    end

    comments = Comment.where(commentable_type: obj.class.name, commentable_id: obj.id)
    
    if comments.any?
      comments.each do |comment| 
        comment.likes.each {|like| like.destroy }
        destroy_all_comments_likes_activities_and_responses_of_obj(comment)
        comment.delete 
      end
    end

  end

  def create_response(obj, act, description = '')
    acted_upon_created_by_user_id = (obj.class.name == 'Update') ? obj.sender_user_id : obj.user_id
    @response = Response.create!(user_id: acted_upon_created_by_user_id, acted_upon_type: obj.class.name, acted_upon_id: obj.id, act: act, actor_id: current_user.id, description: description, action: params[:action], controller: params[:controller])  
  end

  def destroy_response(obj, act)
    acted_upon_created_by_user_id = (obj.class.name == 'Update') ? obj.sender_user_id : obj.user_id
    response = Response.find_by(user_id: acted_upon_created_by_user_id, acted_upon_type: obj.class.name, acted_upon_id: obj.id, act: act, actor_id: current_user.id)
    response.destroy unless response.nil? 
  end

  def add_location_to_user_albums(location)
    if current_user.albums.any?
      current_user.albums.each do |album|
        album.country_id = location.country_id if !location.country_id.nil?
        album.state_id = location.state_id if !location.state_id.nil?
        album.city_id = location.city_id if !location.city_id.nil?
        album.pin_id = location.pin_id if !location.pin_id.nil?
        
        album.save
      end
    end
  end
  
  def redirect_with_notice_if_incorrect_user(obj, notice = "Unauthorized action")
    redirect_to root_url, notice: notice unless current_user_id_is_same_as_user_id?(obj)
  end

  def current_user_id_is_same_as_user_id?(obj)
    current_user.id == obj.user_id
  end
end
