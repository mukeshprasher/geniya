class Album < ActiveRecord::Base
  belongs_to :user
  has_many :album_uploads
  has_many :uploads, through: :album_uploads
end
