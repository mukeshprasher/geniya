class City < ActiveRecord::Base
  belongs_to :state
  has_one :country, through: :state
  has_many :pins, dependent: :destroy
  has_many :locations, dependent: :destroy

  validates :name, length: { minimum: 2,  maximum: 50 }
end
