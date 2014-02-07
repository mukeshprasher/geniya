class CreateUserSubCategories < ActiveRecord::Migration
  def change
    create_table :user_sub_categories do |t|
      t.integer :user_id
      t.integer :sub_category_id

      t.timestamps
    end
  end
end
