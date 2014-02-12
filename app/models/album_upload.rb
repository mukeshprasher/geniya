class AlbumUpload < ActiveRecord::Base
  belongs_to :album
  belongs_to :upload
end
