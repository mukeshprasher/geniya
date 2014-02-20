class CreateDevelopmentLogs < ActiveRecord::Migration
  def change
    create_table :development_logs do |t|
      t.integer :user_id
      t.string :kind
      t.string :title
      t.text :description
      t.attachment :file_attachment

      t.timestamps
    end
  end
end
