class CreateMenuitems < ActiveRecord::Migration
  def change
    create_table :menuitems do |t|
      t.integer :user_id
      t.integer :menucategory_id
      t.string :name
      t.string :price
      t.text :description

      t.timestamps
    end
  end
end
