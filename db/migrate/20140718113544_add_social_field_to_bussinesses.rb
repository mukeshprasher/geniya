class AddSocialFieldToBussinesses < ActiveRecord::Migration
  def change
    add_column :bussinesses, :facebook_link, :string
    add_column :bussinesses, :twitter_link, :string
    add_column :bussinesses, :youtube_link, :string
    add_column :bussinesses, :google_link, :string
  end
end
