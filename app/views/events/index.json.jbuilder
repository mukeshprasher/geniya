json.array!(@events) do |event|
  json.extract! event, :id, :user_id, :title, :description, :start, :end, :location, :privacy
  json.url event_url(event, format: :html)
end
