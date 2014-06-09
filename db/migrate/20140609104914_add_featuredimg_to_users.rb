class AddFeaturedimgToUsers < ActiveRecord::Migration
  def change
    add_column :users, :feature_img, :string
  end
end
