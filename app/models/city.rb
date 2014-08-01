class City < ActiveRecord::Base
  belongs_to :state
  has_one :country, through: :state
  has_many :pins, dependent: :destroy
  has_many :locations, dependent: :destroy
end
