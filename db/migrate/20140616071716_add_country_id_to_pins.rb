class AddCountryIdToPins < ActiveRecord::Migration
  def change
    add_column :pins, :country_id, :integer
  end
end
