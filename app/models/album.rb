class Album < ActiveRecord::Base
  belongs_to :user
  belongs_to :update
  belongs_to :category
  has_many :uploads
  has_many :videos
  has_many :covers
  has_many :multiuploads
  has_many :likes,foreign_key: 'likeable_id'
  has_many :comments, foreign_key: 'commentable_id'
  has_attached_file :cover, :styles => { :large => "600x600>", :medium => "300x300>", :small => "100x100>" }, :default_url => "/assets/missing-image-geniya.png", :hash_secret => "geniyaAttach", :path => ":rails_root/public/system/albumcovers/:id_:style.:extension", :url => "/system/albumcovers/:id_:style.:extension",
                        :storage        => :s3                                                 ,
                      :s3_credentials => {:bucket            => 'geniyanet',
                                          :access_key_id     => 'AKIAIUP2GZ5XEI6BZW3A',
                                          :secret_access_key => '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'},
                      :s3_protocol    => "http"                                             ,
                      :bucket => "geniyanet"
  crop_attached_file :cover , :aspect => "600:600"
  validates_attachment :cover, 
  :content_type => { :content_type => ["image/jpg", "image/jpeg", "image/gif", "image/png"] },
  :size => { :in => 0..1000.kilobytes },
  :file_name => { :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/] }


  
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]
  acts_as_likeable
  acts_as_commentable
  is_impressionable :unique => :user_id, :counter_cache => true

  #letsrate_rateable "rating"

  def slug_candidates
    [
      [:name]
    ]
  end
end
