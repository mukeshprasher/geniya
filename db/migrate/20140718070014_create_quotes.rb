class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.integer :user_id
      t.integer :page_id
      t.integer :sender_id
      t.string :name
      t.string :email
      t.string :contact
      t.text :message

      t.timestamps
    end
  end
end
