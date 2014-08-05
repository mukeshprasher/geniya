class State < ActiveRecord::Base
  belongs_to :country
  has_many :cities, dependent: :destroy

  include ActiveModel::Validations  
  validates :name, length: { minimum: 2,  maximum: 12 }
end
