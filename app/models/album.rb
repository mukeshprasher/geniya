class Album < ActiveRecord::Base
  belongs_to :user
  belongs_to :advertisement
  belongs_to :update
  belongs_to :category
  has_many :uploads
  has_many :likes,foreign_key: 'likeable_id'
  has_many :comments, foreign_key: 'commentable_id'
  
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]
  acts_as_likeable
  acts_as_commentable
  is_impressionable :unique => :user_id, :counter_cache => true

  #letsrate_rateable "rating"

  def slug_candidates
    [
      [:name]
    ]
  end
end
