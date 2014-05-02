class CreateUsertags < ActiveRecord::Migration
  def change
    create_table :usertags do |t|
      t.string :name
      t.integer :user_id
      t.timestamps
    end
  end
end
