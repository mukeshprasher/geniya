class Share < ActiveRecord::Base
  belongs_to :user
  belongs_to :update
  belongs_to :video
  belongs_to :album
  belongs_to :multiupload
  
  validates_presence_of :shared_id
  validates_presence_of :shared_type
end
