class AddFeedbackIdToFeedbackReplies < ActiveRecord::Migration
  def change
    add_column :feedback_replies, :feedback_id, :integer
  end
end
