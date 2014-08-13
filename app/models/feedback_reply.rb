class FeedbackReply < ActiveRecord::Base
  belongs_to :user
  belongs_to :feedback

  #letsrate_rateable "rating"
  validates :message,  presence: true, length: { minimum: 2}  
  
end
