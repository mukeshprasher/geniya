class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.integer :user_id
      t.integer :connection_id
      t.string :status
      t.datetime :accepted_at

      t.timestamps
    end
  end
end
