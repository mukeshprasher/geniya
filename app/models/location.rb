class Location < ActiveRecord::Base
  belongs_to :state
  belongs_to :country
  belongs_to :city
  belongs_to :pin
  belongs_to :user
  belongs_to :organization
  
  include ActiveModel::Validations  
  validates :new_country, length: { minimum: 2,  maximum: 12 }
  validates :new_state, length: { minimum: 2,  maximum: 12 }
  validates :new_city, length: { minimum: 2,  maximum: 10 }
  validates :new_pin, length: { minimum: 2,  maximum: 8 }
  validates :street_address, length: { minimum: 2,  maximum: 25 }
end
