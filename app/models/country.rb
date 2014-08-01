class Country < ActiveRecord::Base
  has_many :states, dependent: :destroy
  has_many :cities, through: :states, dependent: :destroy
  has_many :pins, dependent: :destroy
end
