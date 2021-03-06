class Category < ActiveRecord::Base
  has_many :users
  has_many :sub_categories, dependent: :destroy, order:('name asc')
  has_many :organizations
  has_many :sub_category_groups
  has_many :advertisements
  has_many :albums
  has_many :jobs
  validates :name, presence: true
  
  extend FriendlyId
  friendly_id :slug_categories, use: [:slugged, :finders]
  
  def slug_categories
    [
      [:name]
    ]
  end
  
end
