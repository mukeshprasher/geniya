class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.integer :album_id
      t.integer :user_id
      t.string :name
      t.string :title
      t.text :description
      t.attachment :file_attachment
      t.string :file_type
      t.string :extension
      t.string :special_attribute
      t.string :file_attachment_fingerprint
      
      t.timestamps
    end
  end
end
