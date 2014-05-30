class Upload < ActiveRecord::Base
  belongs_to :album
  belongs_to :user
  belongs_to :update
  
  has_attached_file :file_attachment, :styles => { :medium => "300x300>", :thumb => "400x400>" }, :default_url => "/assets/missing.png", :hash_secret => "geniyaAttach"
  validates_attachment_content_type :file_attachment, :content_type => /.*/
  validates_attachment :file_attachment, :presence => true,
  :content_type => { :content_type => ["image/jpg", "image/jpeg", "image/gif", "image/png", "application/pdf"] },
  :size => { :in => 0..2000.kilobytes },
  :file_name => { :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/, /pdf\Z/] }
  # , /mpg\Z/, /ogv\Z/, /mp4\Z/, /webm\Z/, /flv\Z/, /avi\Z/, /3gp\Z/

  crop_attached_file :file_attachment #, :aspect => "1:1" #, -> { where special_attribute: 'headshot' }

#  before_save do 
#    if self.special_attribute == 'headshot' or self.special_attribute == 'covershot'
#      ratio = (self.special_attribute == 'headshot') ? '1:1' : '10:3'
#      Upload.crop_attached_file :file_attachment, aspect: ratio
#    end
#  end

#  crop_attached_file :file_attachment, :aspect => "500:150", -> { where special_attribute: 'covershot' }
#  before_post_process :skip_for_audio
  is_impressionable :unique => :user_id, :counter_cache => true

#  def skip_for_audio
#    ! %w(audio/ogg application/ogg video/ogg).include?(file_attachment_content_type)
#  end
end

# File attachment translation missing: en.activerecord.errors.models.upload.attributes.file_attachment.spoofed_media_type
