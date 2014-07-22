class Video < ActiveRecord::Base
  belongs_to :user
  has_many :likes,foreign_key: 'likeable_id'
  has_many :comments, foreign_key: 'commentable_id'
  has_attached_file :file_attachment, :hash_secret => "geniyaAttach",
                        :storage        => :s3                                                 ,
                      :s3_credentials => {:bucket            => 'geniyanet',
                                          :access_key_id     => 'AKIAIUP2GZ5XEI6BZW3A',
                                          :secret_access_key => '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'},
                      :s3_protocol    => "https"                                             ,
                      :s3_host_name   => "s3-us-west-1.amazonaws.com",
                      :bucket => "geniyanet"
  validates_attachment :file_attachment, :presence => true,
  :content_type => { :content_type => ["video/mpeg", "video/ogg", "video/mp4", "video/webm", "video/x-flv", "video/x-msvideo", "video/3gpp"] },
  :size => { :in => 0..10.megabytes },
  :file_name => { :matches => [/mpg\Z/, /ogv\Z/, /mp4\Z/, /webm\Z/, /flv\Z/, /avi\Z/, /3gp\Z/] }

  acts_as_likeable
  acts_as_commentable 
  #is_impressionable counter_cache: true
  is_impressionable :unique => :user_id, :counter_cache => true
  extend FriendlyId
  friendly_id :slug_adds, use: [:slugged, :finders]  

  def slug_adds
    [
      [:name]
    ]
  end 
end
