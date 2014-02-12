class UserConnection < ActiveRecord::Base
  belongs_to :sender_user, class_name: "User", :foreign_key =>"sender_user_id"
  belongs_to :user
end
