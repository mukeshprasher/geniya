class Category < ActiveRecord::Base
  has_many :users
  has_many :sub_categories, dependent: :destroy
  has_many :albums
  validates :name, presence: true
  default_scope -> { order('"order" ASC') }
  
  extend FriendlyId
  friendly_id :slug_categories, use: [:slugged, :finders]
  
  def slug_categories
    [
      [:name]
    ]
  end
  
end
