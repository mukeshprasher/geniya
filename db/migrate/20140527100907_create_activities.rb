class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :user_id
      t.string :acted_upon_type
      t.integer :acted_upon_id
      t.string :action
      t.text :description

      t.timestamps
    end
  end
end
