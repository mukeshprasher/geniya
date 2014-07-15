class AddParentIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :parent_id, :integer, default: "0"
  end
end
