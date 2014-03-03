class Upload < ActiveRecord::Base
  belongs_to :album
  belongs_to :user

  has_attached_file :file_attachment
  #, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/missing.png", :hash_secret => "geniyaAttach"
  validates_attachment :file_attachment, :presence => true,
  :content_type => { :content_type => ["image/jpg", "image/jpeg", "image/gif", "image/png", "application/pdf", "video/mpeg", "video/ogg", "video/mp4", "video/webm", "video/x-flv", "video/x-msvideo", "video/3gpp"] },
  :size => { :in => 0..10.megabytes },
  :file_name => { :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/, /pdf\Z/, /mpg\Z/, /ogv\Z/, /mp4\Z/, /webm\Z/, /flv\Z/, /avi\Z/, /3gp\Z/] }

  before_post_process :skip_for_audio
  is_impressionable counter_cache: true

  def skip_for_audio
    ! %w(audio/ogg application/ogg video/ogg).include?(file_attachment_content_type)
  end
end

# File attachment translation missing: en.activerecord.errors.models.upload.attributes.file_attachment.spoofed_media_type
