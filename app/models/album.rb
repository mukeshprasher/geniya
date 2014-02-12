class Album < ActiveRecord::Base
  belongs_to :user
  has_many :album_uploads, dependent: :destroy
  has_many :uploads, through: :album_uploads
end
