class Location < ActiveRecord::Base
  belongs_to :state
  belongs_to :country
  belongs_to :city
  belongs_to :pin
  belongs_to :user
  belongs_to :organization
  
  validates :new_country, length: { maximum: 50 }
  validates :new_state, length: {maximum: 50 }
  validates :new_city, length: {maximum: 50 }
  validates :new_pin, length: { maximum: 20 }
  validates :street_address, length: {maximum: 50 }
end
