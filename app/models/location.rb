class Location < ActiveRecord::Base
  belongs_to :state
  belongs_to :country
  belongs_to :city
  belongs_to :pin
  belongs_to :user
  belongs_to :organization
end
