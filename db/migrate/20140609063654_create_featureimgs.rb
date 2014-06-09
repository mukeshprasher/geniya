class CreateFeatureimgs < ActiveRecord::Migration
  def change
    create_table :featureimgs do |t|
      t.string :name
      t.integer :user_id
      t.attachment :feature_img
      t.timestamps
    end
  end
end
