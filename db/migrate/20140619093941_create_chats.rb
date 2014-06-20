class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.integer :user_id
      t.integer :reciever_id
      t.text :message
      t.string :status, :default => "unread"

      t.timestamps
    end
  end
end
