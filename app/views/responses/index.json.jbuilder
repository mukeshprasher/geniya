json.array!(@responses) do |response|
  json.extract! response, :id, :user_id, :acted_upon_type, :acted_upon_id, :action, :actor_id, :description, :status, :controller, :action
  json.url response_url(response, format: :json)
end
