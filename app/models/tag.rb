class Tag < ActiveRecord::Base
  has_many :user_tags
  has_many :users, through: :user_tags

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
end
