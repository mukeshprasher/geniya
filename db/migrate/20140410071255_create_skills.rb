class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name
      t.integer :user_id
      t.string :slug

      t.timestamps
    end
  end
end
