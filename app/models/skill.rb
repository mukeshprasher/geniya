class Skill < ActiveRecord::Base
  include ActiveModel::Validations
  validates :name, presence: true 
  extend FriendlyId
  friendly_id :slug_skills, use: [:slugged, :finders]  
  has_many :userskills
  has_many :users, through: :userskills
  
  
  def slug_skills
    [
      [:name]
    ]
  end  
    
end
