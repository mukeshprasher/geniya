class Organization < ActiveRecord::Base
  has_many :affiliations, dependent: :destroy
  has_many :users, through: :affiliations
  belongs_to :user
  #has_many :addresses
  belongs_to :category
  belongs_to :sub_category 
  has_many :locations
  has_many :jobs

  validates :name,  presence: true, length: {maximum: 40 }
  validates :start_date,  presence: true, length: {maximum: 40 }
end
