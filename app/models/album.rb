class Album < ActiveRecord::Base
  belongs_to :user
  has_many :uploads
  
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]
  
  def slug_candidates
    [
      [:name]
    ]
  end
end
