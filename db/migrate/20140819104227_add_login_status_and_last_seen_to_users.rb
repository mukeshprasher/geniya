class AddLoginStatusAndLastSeenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :login_status, :string
    add_column :users, :last_seen, :datetime
  end
end
