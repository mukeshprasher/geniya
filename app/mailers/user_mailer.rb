class UserMailer < ActionMailer::Base
  default from: "neeraj.avant.garde@gmail.com"

  def activation_email(user)
    @user = user
    @url  = new_session_url
    mail(to: @user.email, subject: 'Geniya account activation')
  end

#  def activation_email(user)
#    #@req = request.original_url
#    @newsletter = newsletter
#    @subscriptions = Subscription.where(name: 'newsletter', status: 'subscribed')
#    @subscriptions.each do |subscription|
#      @email = subscription.email
#      @token = subscription.random_token
#      mail(to: @email, subject: @newsletter.subject)
#    end
#    
#  end
end
