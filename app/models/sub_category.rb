class SubCategory < ActiveRecord::Base
  has_many :users
  belongs_to :category
  
  validates :name, presence: true
  validates :category_id, presence: true
  
  extend FriendlyId
  friendly_id :slug_sub_categories, use: [:slugged, :finders]
  
  def slug_sub_categories
    [
      [:name]
    ]
  end  
  
  
end
