class AddTaglineToBussinesses < ActiveRecord::Migration
  def change
    add_column :bussinesses, :tagline, :text
  end
end
