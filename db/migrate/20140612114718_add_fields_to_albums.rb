class AddFieldsToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :country_id, :integer
    add_column :albums, :state_id, :integer
    add_column :albums, :city_id, :integer
    add_column :albums, :pin_id, :integer
  end
end
