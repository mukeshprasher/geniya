class AddHeightStatsAndWeightStatsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :height_stats, :string
    add_column :users, :weight_stats, :string
  end
end
