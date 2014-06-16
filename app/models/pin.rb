class Pin < ActiveRecord::Base
  belongs_to :country
  belongs_to :city
  has_many :locations
end
