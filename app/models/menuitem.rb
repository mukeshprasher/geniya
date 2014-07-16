class Menuitem < ActiveRecord::Base
   belongs_to :user
   belongs_to :menucategory
end
