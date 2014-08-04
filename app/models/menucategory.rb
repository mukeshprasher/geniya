class Menucategory < ActiveRecord::Base
  has_many:menuitems, dependent: :destroy
  has_many :user_menucategories, dependent: :destroy
  has_many :users, through: :user_menucategories  
end
