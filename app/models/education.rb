class Education < ActiveRecord::Base
  belongs_to :user

  include ActiveModel::Validations  
  validates :institute_name,  presence: true, length: { minimum: 4,  maximum: 35 }
  validates :course_name,  presence: true, length: { minimum: 4,  maximum: 30 }
end
