class AddPrivacyAndLocationToEvents < ActiveRecord::Migration
  def change
    add_column :events, :privacy, :string, default: 'connections'
    add_column :events, :location, :text
  end
end
