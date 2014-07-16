class CreateMenucategories < ActiveRecord::Migration
  def change
    create_table :menucategories do |t|
      t.string :name

      t.timestamps
    end
  end
end
