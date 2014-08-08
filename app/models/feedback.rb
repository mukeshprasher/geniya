class Feedback < ActiveRecord::Base
  belongs_to :user
  has_many :replies, foreign_key: "parent_id", class_name:  "Feedback",  dependent:   :destroy
end
