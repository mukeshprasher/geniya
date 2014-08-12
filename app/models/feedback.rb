class Feedback < ActiveRecord::Base
  belongs_to :user
#  has_many :replies, foreign_key: "parent_id", class_name:  "Feedback",  dependent:   :destroy
  has_many :feedback_replies,  dependent:   :destroy
  validates :subject,  presence: true, length: { minimum: 5,  maximum: 70}
  validates :status,  presence: true, length: { minimum: 3,  maximum: 30}
  validates :kind,  presence: true, length: { minimum: 3,  maximum: 30}
  validates :priority,  presence: true, length: { minimum: 3,  maximum: 30}
  
    
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  
end
