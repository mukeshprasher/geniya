class Update < ActiveRecord::Base
  belongs_to :user, foreign_key: "sender_user_id"
  belongs_to :receiver, :class_name =>"User", :foreign_key =>"receiver_user_id"
  validates :text, presence: true 
  validates :sender_user_id, presence: true
  validates :receiver_user_id, presence: true
  default_scope -> { order('created_at DESC') }
end
