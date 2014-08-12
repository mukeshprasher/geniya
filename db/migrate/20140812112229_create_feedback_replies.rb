class CreateFeedbackReplies < ActiveRecord::Migration
  def change
    create_table :feedback_replies do |t|
      t.integer :parent_id
      t.integer :user_id
      t.string :message

      t.timestamps
    end
  end
end
