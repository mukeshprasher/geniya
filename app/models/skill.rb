class Skill < ActiveRecord::Base
  validates :name, presence: true 
  extend FriendlyId
  friendly_id :slug_skills, use: [:slugged, :finders]  
  
  has_many :job_skills
  has_many :jobs, through: :job_skills
  
  has_many :user_skills
  has_many :users, through: :user_skills
  
  def slug_skills
    [
      [:name]
    ]
  end  

  validates :name,  presence: true, length: { minimum:2 }
    
end
