json.array!(@feedback_replies) do |feedback_reply|
  json.extract! feedback_reply, :id, :parent_id, :user_id, :message
  json.url feedback_reply_url(feedback_reply, format: :json)
end
