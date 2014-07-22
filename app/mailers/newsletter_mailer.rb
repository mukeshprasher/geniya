class NewsletterMailer < ActionMailer::Base
  default from: "geniya.network@gmail.com"

  def welcome_email(user)
    #not used, for test only
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def newsletter_email(newsletter)
    #@req = request.original_url
    @newsletter = newsletter
    @subscriptions = Subscription.where(name: 'newsletter', status: 'subscribed')
    @subscriptions.each do |subscription|
      @email = subscription.email
      @token = subscription.random_token
      mail(to: @email, subject: @newsletter.subject)
    end
    
  end
end
