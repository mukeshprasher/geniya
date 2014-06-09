class Featureimg < ActiveRecord::Base
  belongs_to :user
  has_attached_file :feature_img, :styles => { :large => "600x600>", :medium => "300x300>", :small => "100x100>" }, :default_url => "/assets/missing-image-geniya.png", :hash_secret => "geniyaAttach", :path => ":rails_root/public/system/featureimgs/:id_:style.:extension", :url => "/system/featureimgs/:id_:style.:extension",
                        :storage        => :s3                                                 ,
                      :s3_credentials => {:bucket            => 'geniya',
                                          :access_key_id     => 'AKIAIDTQALVDJOTAFN5A',
                                          :secret_access_key => '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'},
                      :s3_protocol    => "https"                                             ,
                      :s3_host_name   => "s3-us-west-1.amazonaws.com",
                      :bucket => "geniya"
  crop_attached_file :feature_img , :aspect => "2:5"
  validates_attachment :feature_img, 
  :content_type => { :content_type => ["image/jpg", "image/jpeg", "image/gif", "image/png"] },
  :size => { :in => 0..1000.kilobytes },
  :file_name => { :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/] }

end
