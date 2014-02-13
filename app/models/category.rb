class Category < ActiveRecord::Base
  has_many :sub_categories, dependent: :destroy
  validates :name, presence: true
  default_scope -> { order('name ASC') }
  
  extend FriendlyId
  friendly_id :slug_categories, use: [:slugged, :finders]
  
  def slug_categories
    [
      [:name]
    ]
  end
  
end
