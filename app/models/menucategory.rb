class Menucategory < ActiveRecord::Base
  has_many:menuitems
  has_many :user_menucategories
  has_many :users, through: :user_menucategories  
end
