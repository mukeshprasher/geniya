class Pin < ActiveRecord::Base
  belongs_to :city
  has_many :locations
end
