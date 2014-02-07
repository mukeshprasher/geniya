class SubCategory < ActiveRecord::Base
  belongs_to :category
  has_many   :user_sub_categories
  has_many    :users, :through => :user_sub_categories
  
  validates :name, presence: true
  validates :category_id, presence: true
end
