class Affiliation < ActiveRecord::Base
  belongs_to :user
  belongs_to :organization
  belongs_to :sub_category
end
