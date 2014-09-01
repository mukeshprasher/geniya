class Menuitem < ActiveRecord::Base
   belongs_to :user
   belongs_to :menucategory
   
   validates :name,  presence: true, length: {maximum: 50 }  
   validates :price,  presence: true, length: {maximum: 5 }  
   validates :description,  presence: true, length: {maximum: 70 }  
end
