class Multiupload < ActiveRecord::Base

  has_attached_file :multiupload

  include Rails.application.routes.url_helpers


  def to_jq_upload
    {
      "name" => read_attribute(:multiupload_file_name),
      "size" => read_attribute(:multiupload_file_size),
      "url" => multiupload.url(:original),
      "delete_url" => multiupload_path(self),
      "delete_type" => "DELETE"
    }
  end

end
