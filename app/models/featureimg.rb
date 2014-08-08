class Featureimg < ActiveRecord::Base
  belongs_to :user
  has_attached_file :feature_img, :styles => { :large => "600x600>", :medium => "300x300>", :small => "100x100>" }, :default_url => "/assets/missing-image-geniya.png", :hash_secret => "geniyaAttach", :path => ":rails_root/public/system/featureimgs/:id_:style.:extension", :url => "/system/featureimgs/:id_:style.:extension"
#                        :storage        => :s3                                                 ,
#                      :s3_credentials => {:bucket            => 'geniyanet',
#                                          :access_key_id     => 'AKIAIUP2GZ5XEI6BZW3A',
#                                          :secret_access_key => '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'},
#                      :s3_protocol    => "http"                                             ,
#                      :bucket => "geniyanet"
  crop_attached_file :feature_img , :aspect => "215:400"
  validates_attachment :feature_img, 
  :content_type => { :content_type => ["image/jpg", "image/jpeg", "image/gif", "image/png"] },
  :size => { :in => 0..1000.kilobytes },
  :file_name => { :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/] }

end
