class CreateUserskills < ActiveRecord::Migration
  def change
    create_table :userskills do |t|
      t.references :user
      t.references :skill

      t.timestamps
    end
  end
end
