class SubCategory < ActiveRecord::Base
  has_one :category, foreign_key: "category_id", class_name:  "category",  dependent:   :destroy 
  validates :name, presence: true
  validates :category_id, presence: true
end
