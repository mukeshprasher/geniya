class Organization < ActiveRecord::Base
  has_many :affiliations
  has_many :users, through: :affiliations
  has_many :addresses
  belongs_to :category
  belongs_to :sub_category 
  has_many :locations
  has_many :jobs

  include ActiveModel::Validations  
  validates :name,  presence: true, length: { minimum: 4 }
end
