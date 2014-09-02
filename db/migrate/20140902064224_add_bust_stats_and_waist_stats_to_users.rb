class AddBustStatsAndWaistStatsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bust_stats, :string
    add_column :users, :waist_stats, :string
  end
end
