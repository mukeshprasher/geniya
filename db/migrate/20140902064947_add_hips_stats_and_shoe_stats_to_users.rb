class AddHipsStatsAndShoeStatsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :hips_stats, :string
    add_column :users, :shoe_stats, :string
  end
end
