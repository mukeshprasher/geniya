class Chat < ActiveRecord::Base
  belongs_to :user
  belongs_to :reciever, class_name: 'User'
  
  validates :message,  presence: true
  validates :reciever_id,  presence: true, :numericality => { :greater_than_or_equal_to => 0 }
end
