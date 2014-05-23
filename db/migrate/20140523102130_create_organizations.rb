class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.integer :cateogry_id
      t.date :start_date
      t.integer :address_id
      t.integer :user_id

      t.timestamps
    end
  end
end
