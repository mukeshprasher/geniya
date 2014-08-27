class Quote < ActiveRecord::Base
  belongs_to :user
  validates :name,  presence: true, length: { minimum: 1, maximum: 30 }
  validates :email, presence: true, length: { minimum: 1, maximum: 50 }
  validates :contact, presence: true, length: { minimum: 1, maximum: 20 }
end
