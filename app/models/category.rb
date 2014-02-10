class Category < ActiveRecord::Base
  has_many :sub_categories, dependent: :destroy
  validates :name, presence: true
  default_scope -> { order('name ASC') }
end
