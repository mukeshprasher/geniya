class AddIndexToMessages < ActiveRecord::Migration
  def change
    add_index :messages, :recipient_id
  end
end
