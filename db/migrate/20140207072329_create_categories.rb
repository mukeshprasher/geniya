class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :slug
      t.integer :order

      t.timestamps
    end
      add_index :categories, :name, unique: true
  end
end
