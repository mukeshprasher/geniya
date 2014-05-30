json.array!(@activities) do |activity|
  json.extract! activity, :id, :user_id, :acted_upon_type, :acted_upon_id, :action, :description
  json.url activity_url(activity, format: :json)
end
