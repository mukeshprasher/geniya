class AddUserTypeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :kind, :string, default: "user"
  end
end
