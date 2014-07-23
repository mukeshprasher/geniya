class Cover < ActiveRecord::Base
  belongs_to :user

  has_attached_file :file_attachment, :styles => { :large => "1000x300>", :medium => "500x150>", :small => "250x75>" }, :default_url => "/assets/missing.png", :hash_secret => "geniyaAttach", :path => ":rails_root/public/system/covers/:id_:style.:extension", :url => "/system/covers/:id_:style.:extension",
                        :storage        => :s3                                                 ,
                      :s3_credentials => {:bucket            => 'geniyanet',
                                          :access_key_id     => 'AKIAIUP2GZ5XEI6BZW3A',
                                          :secret_access_key => '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'},
                      :s3_protocol    => "https"                                             ,
                      :bucket => "geniyanet"
  validates_attachment :file_attachment, :presence => true,
  :content_type => { :content_type => ["image/jpg", "image/jpeg", "image/gif", "image/png"] },
  :size => { :in => 0..2000.kilobytes },
  :file_name => { :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/] }  
  
  crop_attached_file :file_attachment , :aspect => "500:150"
end
