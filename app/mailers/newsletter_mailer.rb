class NewsletterMailer < ActionMailer::Base
  default from: "neeraj@localhost.com"

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def newsletter_email(newsletter)
    @newsletter = newsletter
    @email_ids = Subscription.where(name: 'newsletter', status: 'subscribed').pluck(:email)
    mail(bcc: @email_ids, subject: @newsletter.subject)
  end
end
