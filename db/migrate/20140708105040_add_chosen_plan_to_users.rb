class AddChosenPlanToUsers < ActiveRecord::Migration
  def change
    add_column :users, :chosen_plan, :string
  end
end
