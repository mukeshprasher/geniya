class AddChangePasswordCodeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :change_password_code, :string
  end
end
