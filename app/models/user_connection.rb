class UserConnection < ActiveRecord::Base
  belongs_to :sender_user, class_name: "User"
  belongs_to :user, class_name: "User"
end
