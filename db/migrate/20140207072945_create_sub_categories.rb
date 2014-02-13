class CreateSubCategories < ActiveRecord::Migration
  def change
    create_table :sub_categories do |t|
      t.string :name
      t.integer :category_id
      t.string :slug

      t.timestamps
    end
      add_index :sub_categories, :name, unique: true
      add_index :sub_categories, :category_id
      add_index :sub_categories, :slug, unique: true
  end
end
