class CreateUserConnections < ActiveRecord::Migration
  def change
    create_table :user_connections do |t|
      t.integer :sender_user_id
      t.integer :user_id
      t.string :status

      t.timestamps
    end
    add_index :user_connections, :sender_user_id, unique: true
    add_index :user_connections, :user_id, unique: true
    add_index :user_connections, :status, unique: true
  end
end
