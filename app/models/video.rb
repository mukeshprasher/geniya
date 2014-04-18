class Video < ActiveRecord::Base
  belongs_to :user

  has_attached_file :file_attachment, :hash_secret => "geniyaAttach"
  validates_attachment :file_attachment, :presence => true,
  :content_type => { :content_type => ["video/mpeg", "video/ogg", "video/mp4", "video/webm", "video/x-flv", "video/x-msvideo", "video/3gpp"] },
  :size => { :in => 0..10.megabytes },
  :file_name => { :matches => [/mpg\Z/, /ogv\Z/, /mp4\Z/, /webm\Z/, /flv\Z/, /avi\Z/, /3gp\Z/] }

  acts_as_likeable
  acts_as_commentable 
 
  extend FriendlyId
  friendly_id :slug_adds, use: [:slugged, :finders]  

  def slug_adds
    [
      [:name]
    ]
  end 
end
