json.array!(@feedbacks) do |feedback|
  json.extract! feedback, :id, :parent_id, :user_id, :email, :kind, :subject, :description, :priority, :status
  json.url feedback_url(feedback, format: :json)
end
