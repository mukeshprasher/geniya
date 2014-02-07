class UserSubCategory < ActiveRecord::Base
  belongs_to :user
  belongs_to :sub_category
end
