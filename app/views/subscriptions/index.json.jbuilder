json.array!(@subscriptions) do |subscription|
  json.extract! subscription, :id, :name, :email, :user_id, :status
  json.url subscription_url(subscription, format: :json)
end
