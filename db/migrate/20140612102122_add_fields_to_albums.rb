class AddFieldsToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :comment_count, :string, default: "0"
    add_column :albums, :like_count, :string, default: "0"
  end
end
