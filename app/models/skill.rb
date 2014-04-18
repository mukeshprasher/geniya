class Skill < ActiveRecord::Base
  include ActiveModel::Validations
  belongs_to :user
  validates :name, presence: true 
  extend FriendlyId
  friendly_id :slug_skills, use: [:slugged, :finders]  
  
  def slug_skills
    [
      [:name]
    ]
  end  
    
end
