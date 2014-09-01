class Menucategory < ActiveRecord::Base
  has_many:menuitems, dependent: :destroy
  has_many :user_menucategories, dependent: :destroy
  has_many :users, through: :user_menucategories
  
  validates :name,  presence: true, length: {maximum: 50 }  
end
