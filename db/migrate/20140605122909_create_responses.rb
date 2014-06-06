class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :user_id
      t.string :acted_upon_type
      t.integer :acted_upon_id
      t.string :act
      t.integer :actor_id
      t.text :description
      t.integer :status, :default => 0
      t.string :controller
      t.string :action

      t.timestamps
    end
  end
end
