class Category < ActiveRecord::Base
  has_many :sub_categories, dependent: :destroy
  validates :name, presence: true
end
