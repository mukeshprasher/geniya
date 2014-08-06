class AddSubCategoryIdToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :sub_category_id, :integer
  end
end
