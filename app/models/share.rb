class Share < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :shared_id
  validates_presence_of :shared_type
end
