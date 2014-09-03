class Education < ActiveRecord::Base
  belongs_to :user

  validates :institute_name,  presence: true, length: { minimum: 1,  maximum: 80 }
  validates :course_name,  presence: true, length: { minimum: 1,  maximum: 80 }
end
