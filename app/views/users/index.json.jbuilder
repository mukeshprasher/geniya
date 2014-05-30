json.array!(@users) do |user|
  json.extract! user, :id, :email, :username, :name
  json.url user_url(user, format: :json)
  if user.headshot
    json.headshot user.headshot.file_attachment.url(:thumb)
  else
    json.headshot "/assets/missing-image-geniya.png"
  end
end
