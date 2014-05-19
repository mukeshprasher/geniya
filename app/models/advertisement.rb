class Advertisement < ActiveRecord::Base
  belongs_to :user
  has_many :likes,foreign_key: 'likeable_id'
  has_many :comments, foreign_key: 'commentable_id'
  has_attached_file :file_attachment, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/missing.png", :hash_secret => "geniyaAttach"
  validates_attachment :file_attachment, :presence => true,
  :content_type => { :content_type => ["image/jpg", "image/jpeg", "image/gif", "image/png", "application/pdf", "video/mpeg", "video/ogg", "video/mp4", "video/webm", "video/x-flv", "video/x-msvideo", "video/3gpp"] },
  :size => { :in => 0..10.megabytes },
  :file_name => { :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/, /pdf\Z/, /mpg\Z/, /ogv\Z/, /mp4\Z/, /webm\Z/, /flv\Z/, /avi\Z/, /3gp\Z/] }

  acts_as_likeable
  acts_as_commentable 
  is_impressionable :unique => :user_id, :counter_cache => true
  extend FriendlyId
  friendly_id :slug_adds, use: [:slugged, :finders]  

  def slug_adds
    [
      [:name]
    ]
  end      

end
