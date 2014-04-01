class SubCategoryGroup < ActiveRecord::Base
  belongs_to :category
  has_many :sub_categories
end
