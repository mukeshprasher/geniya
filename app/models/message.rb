class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :user
  belongs_to :recipient, :foreign_key => :recipient_id, class_name: 'User'
  
  validates_presence_of :body, :conversation_id, :user_id
end
