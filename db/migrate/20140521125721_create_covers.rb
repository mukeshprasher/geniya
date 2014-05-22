class CreateCovers < ActiveRecord::Migration
  def change
    create_table :covers do |t|
      t.string :upload_type
      t.integer :album_id
      t.integer :update_id
      t.integer :user_id
      t.string :name
      t.string :title
      t.text :description
      t.attachment :file_attachment
      t.string :file_type
      t.string :extension
      t.string :special_attribute
      t.string :file_attachment_fingerprint
      t.integer :impressions_count, :default => 0

      t.timestamps
    end
  end
end
