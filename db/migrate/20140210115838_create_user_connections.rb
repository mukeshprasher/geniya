class CreateUserConnections < ActiveRecord::Migration
  def change
    create_table :user_connections do |t|
      t.integer :sender_user_id, :null => false
      t.integer :user_id, :null => false
      t.string :status, :default => "requested", :null => false

      t.timestamps
    end
    add_index :user_connections, :sender_user_id
    add_index :user_connections, :user_id
    add_index :user_connections, :status
    add_index :user_connections, [:sender_user_id, :user_id], unique: true
  end
end
