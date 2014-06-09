class AddNotificationStatusToConnections < ActiveRecord::Migration
  def change
    add_column :connections, :notification_status, :integer, :default => 0
  end
end
