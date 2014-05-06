class CreateMultiuploads < ActiveRecord::Migration
  def change
    create_table :multiuploads do |t|
      t.string "multiupload_file_name"
      t.string "multiupload_content_type"
      t.integer "multiupload_file_size"
      t.datetime "multiupload_updated_at"
      t.timestamps
    end
  end
end
