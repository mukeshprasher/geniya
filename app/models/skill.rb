class Skill < ActiveRecord::Base
  belongs_to :user
  
  extend FriendlyId
  friendly_id :slug_skills, use: [:slugged, :finders]  
  
  def slug_skills
    [
      [:name]
    ]
  end  
    
end
