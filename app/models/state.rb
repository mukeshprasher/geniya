class State < ActiveRecord::Base
  belongs_to :country
  has_many :cities, dependent: :destroy

  validates :name, length: { minimum: 2,  maximum: 50 }
end
