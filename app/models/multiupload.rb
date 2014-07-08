class Multiupload < ActiveRecord::Base
  belongs_to :album
  has_attached_file :multiupload,
                        :storage        => :s3                                                 ,
                      :s3_credentials => {:bucket            => 'geniya',
                                          :access_key_id     => 'AKIAIDTQALVDJOTAFN5A',
                                          :secret_access_key => '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'},
                      :s3_protocol    => "https"                                             ,
                      :s3_host_name   => "s3-us-west-1.amazonaws.com",
                      :bucket => "geniya"
  validates_attachment :multiupload, 
  :content_type => { :content_type => ["image/jpg", "image/jpeg", "image/gif", "image/png"] },
  :size => { :in => 0..2000.kilobytes },
  :file_name => { :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/] }

  include Rails.application.routes.url_helpers


  def to_jq_upload
    {
      "description" => read_attribute(:multiupload_file_desc),
      "title" => read_attribute(:multiupload_file_title),
      "name" => read_attribute(:multiupload_file_name),
      "size" => read_attribute(:multiupload_file_size),
      "url" => multiupload.url(:original),
      "delete_url" => multiupload_path(self),
      "delete_type" => "DELETE"
    }
  end

end
