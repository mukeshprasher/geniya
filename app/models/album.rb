class Album < ActiveRecord::Base
  belongs_to :user
  has_many :album_uploads, dependent: :destroy
  has_many :uploads, through: :album_uploads
  
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]
  
  def slug_candidates
    [
      [:name]
    ]
  end
  
end
