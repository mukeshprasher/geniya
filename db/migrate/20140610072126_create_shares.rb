class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.integer :user_id
      t.string :shared_type
      t.integer :shared_id
      t.text :comment

      t.timestamps
    end
  end
end
