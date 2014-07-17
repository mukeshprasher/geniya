class CreateUserMenucategories < ActiveRecord::Migration
  def change
    create_table :user_menucategories do |t|
      t.integer :user_id
      t.integer :menucategory_id

      t.timestamps
    end
  end
end
