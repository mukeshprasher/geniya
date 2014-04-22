class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :name
      t.attachment :file_attachment
      t.integer :user_id
      t.string :slug
      t.integer :impressions_count, :default => 0
      t.timestamps
    end
  end
end
