class Album < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :uploads
  has_many :likes,foreign_key: 'likeable_id'
  
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]
  acts_as_likeable
  def slug_candidates
    [
      [:name]
    ]
  end
end
