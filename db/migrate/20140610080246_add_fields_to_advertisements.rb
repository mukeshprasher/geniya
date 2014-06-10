class AddFieldsToAdvertisements < ActiveRecord::Migration
  def change
    add_column :advertisements, :title, :string
    add_column :advertisements, :slogan, :string
    add_column :advertisements, :description, :string
    add_column :advertisements, :link, :string
    add_column :advertisements, :category_id, :integer
  end
end
