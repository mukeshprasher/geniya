class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.integer :user_id
      t.string :name
      t.string :title
      t.text :description
      t.string :kind
      t.string :slug

      t.timestamps
    end
    add_index :albums, :slug, unique: true
  end
end
