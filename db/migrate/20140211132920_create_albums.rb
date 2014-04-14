class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :name
      t.string :title
      t.text :description
      t.string :kind
      t.string :slug
      t.integer :impressions_count, :default => 0

      t.timestamps
    end
    add_index :albums, :slug, unique: true
    add_index :albums, :category_id
  end
end
