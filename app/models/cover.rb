class Cover < ActiveRecord::Base
  belongs_to :album
  belongs_to :user
  belongs_to :update

  has_attached_file :file_attachment, :styles => { :medium => "300x300>", :thumb => "400x400>" }, :default_url => "/assets/missing.png", :hash_secret => "geniyaAttach", :path => ":rails_root/public/system/covers/:id_:style.:extension", :url => "/system/covers/:id_:style.:extension"
  validates_attachment_content_type :file_attachment, :content_type => /.*/
  validates_attachment :file_attachment, :presence => true,
  :content_type => { :content_type => ["image/jpg", "image/jpeg", "image/gif", "image/png", "application/pdf"] },
  :size => { :in => 0..2000.kilobytes },
  :file_name => { :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/, /pdf\Z/] }  
  
  crop_attached_file :file_attachment , :aspect => "500:150"
  
  is_impressionable :unique => :user_id, :counter_cache => true  

end
