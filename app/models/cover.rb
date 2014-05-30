class Cover < ActiveRecord::Base
  belongs_to :user

  has_attached_file :file_attachment, :styles => { :large => "1000x300>", :medium => "500x150>", :small => "250x75>" }, :default_url => "/assets/missing.png", :hash_secret => "geniyaAttach", :path => ":rails_root/public/system/covers/:id_:style.:extension", :url => "/system/covers/:id_:style.:extension",
                        :storage        => :s3                                                 ,
                      :s3_credentials => {:bucket            => 'geniya',
                                          :access_key_id     => 'AKIAIDTQALVDJOTAFN5A',
                                          :secret_access_key => '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'},
                      :s3_protocol    => "https"                                             ,
                      :s3_host_name   => "s3-us-west-1.amazonaws.com",
                      :bucket => "geniya"
  validates_attachment :file_attachment, :presence => true,
  :content_type => { :content_type => ["image/jpg", "image/jpeg", "image/gif", "image/png"] },
  :size => { :in => 0..2000.kilobytes },
  :file_name => { :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/] }  
  
  crop_attached_file :file_attachment , :aspect => "500:150"
end
