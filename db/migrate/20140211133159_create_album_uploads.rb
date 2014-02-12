class CreateAlbumUploads < ActiveRecord::Migration
  def change
    create_table :album_uploads do |t|
      t.integer :album_id
      t.integer :upload_id

      t.timestamps
    end
  end
end
