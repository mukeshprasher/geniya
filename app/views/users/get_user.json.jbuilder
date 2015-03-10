json.array!(@users) do |user|
  json.extract! user, :id, :email, :username, :name, :slug
  json.url user_url(user, format: :json)
  if user.headshot
    json.headshot user.headshot.file_attachment.url(:thumb)
  else
    json.headshot "/assets/missing-image-geniya.png"
  end
  if user.followers
    if user.followers.count==0
      json.followers "No"
    else
      json.followers user.followers.count
    end    
  end
  
end
