module SessionsHelper
    def sign_in(user)
        remember_token = User.new_remember_token
        cookies.permanent[:remember_token] = remember_token
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
      redirect_to signin_url, notice: "Please sign in."
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
    mentioned_text = text.split.map do |word| 
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
end
