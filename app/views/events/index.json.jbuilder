json.array!(@events) do |event|
  unless (event.privacy == 'connections') and (!@connected_user_ids.include?(event.user_id))
    json.extract! event, :id, :title, :description, :start, :end, :location, :privacy
    json.user do
      json.id event.user.id
      json.name event.user.name
      json.username event.user.username
      if event.user.headshot
        json.headshot event.user.headshot.file_attachment.url(:thumb)
      end
    end
    json.url event_url(event, format: :html)
  end
end
