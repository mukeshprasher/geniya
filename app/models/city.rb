class City < ActiveRecord::Base
  belongs_to :state
  has_one :country, through: :state
  has_many :pins
  has_many :locations
end
