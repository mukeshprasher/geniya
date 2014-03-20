class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.string :email
      t.integer :user_id
      t.string :status

      t.timestamps
    end
  end
end