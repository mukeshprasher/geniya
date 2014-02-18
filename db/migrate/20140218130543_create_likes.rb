class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :object_id
      t.string :object_type

      t.timestamps
    end
  end
end
