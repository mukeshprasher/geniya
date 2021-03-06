class DevelopmentLog < ActiveRecord::Base
  belongs_to :user, -> { where plan: 'admin' }
  has_attached_file :file_attachment, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/missing.png", :hash_secret => "geniyaAttach"
  validates_attachment :file_attachment,
  :content_type => { :content_type => ["image/jpg", "image/jpeg", "image/gif", "image/png", "application/pdf"] },
  :size => { :in => 0..10.megabytes },
  :file_name => { :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/, /pdf\Z/] }

  before_post_process :skip_for_audio

  def skip_for_audio
    ! %w(audio/ogg application/ogg).include?(file_attachment_content_type)
  end
end
