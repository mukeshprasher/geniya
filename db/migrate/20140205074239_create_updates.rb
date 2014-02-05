class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.text :text
      t.string :privacy, :default => 'private'
      t.integer :sender_user_id
      t.integer :receiver_user_id

      t.timestamps
    end

    add_index :updates, :sender_user_id
    add_index :updates, :receiver_user_id
    add_index :updates, :created_at
  end
end
