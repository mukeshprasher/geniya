class UserMailer < ActionMailer::Base
  default from: "geniya.network@gmail.com"

  def activation_email(user)
    @user = user
    @url  = new_session_url
    mail(to: @user.email, subject: 'Geniya account activation')
  end

  def recover_password(user)
    @user = user
    mail(to: @user.email, subject: 'Geniya password recovery')
  end

  def get_quote(quote)
    @quote = quote
    mail(to: @quote.user.email, subject: 'Get Quote Request')
  end

  def feedback_request(feedback)
    @feedback = feedback
    mail(to: ENV["feedback_email"], subject: ' User Feedback Request')
  end

  def feedback_response(feedback_reply)
    @feedback_reply = feedback_reply
    mail(to: ENV["feedback_email"], subject: ' User Response on Feedback')
  end

  def feedback_multiresponse(feedback_reply)
    @feedback_reply = feedback_reply
    if @feedback_reply.feedback.user_id.nil?
      mail(to: @feedback_reply.feedback.email, subject: ' Geniya Response on your Feedback')
    else
      mail(to: @feedback_reply.feedback.user.email, subject: ' Geniya Response on your Feedback')
    end
  end
  
  def invite_contacts(contacts, logged_user)
    @contacts = contacts
    @user = logged_user
    email = Array.new
    @contacts.each do |c|
      email<< c[:email]
    end
    mail(bcc: email.join(","), subject: "Invitation to join #{@user.name.capitalize} on Geniya") 
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
