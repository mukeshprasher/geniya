class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.string :code
      t.integer :city_id

      t.timestamps
    end
  end
end
