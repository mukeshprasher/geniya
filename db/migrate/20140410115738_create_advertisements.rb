class CreateAdvertisements < ActiveRecord::Migration
  def change
    create_table :advertisements do |t|
      t.string :name
      t.string :address
      t.integer :contact
      t.attachment :file_attachment
      t.integer :user_id
      t.string :slug
      t.timestamps
    end
  end
end
