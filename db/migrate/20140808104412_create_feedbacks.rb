class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :parent_id
      t.integer :user_id
      t.string :email
      t.string :kind
      t.string :subject
      t.text :description
      t.string :priority
      t.string :status

      t.timestamps
    end
  end
end
