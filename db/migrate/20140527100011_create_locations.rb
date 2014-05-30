class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :country_id
      t.integer :state_id
      t.integer :city_id
      t.integer :pin_id
      t.string :street_address
      t.decimal :longitude
      t.decimal :latitude
      t.string :new_country
      t.string :new_state
      t.string :new_city
      t.string :new_pin
      t.string :status
      t.integer :user_id
      t.integer :organization_id
      

      t.timestamps
    end
  end
end
