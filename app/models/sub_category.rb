class SubCategory < ActiveRecord::Base
  belongs_to :category
  has_many   :user_sub_categories
  has_many    :users, :through => :user_sub_categories
  
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
