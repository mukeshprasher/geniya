class Organization < ActiveRecord::Base
  has_many :affiliations
  has_many :users, through: :affiliations
  has_many :addresses
  belongs_to :category  
end
