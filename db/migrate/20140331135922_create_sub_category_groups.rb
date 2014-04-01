class CreateSubCategoryGroups < ActiveRecord::Migration
  def change
    create_table :sub_category_groups do |t|
      t.string :name
      t.integer :category_id

      t.timestamps
    end
  end
end
