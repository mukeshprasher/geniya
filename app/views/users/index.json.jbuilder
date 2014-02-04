json.array!(@users) do |user|
  json.extract! user, :id, :email, :username, :password_digest, :name, :gender, :summary, :height, :bust, :hips, :shoes, :hair, :eyes, :birthdate, :available, :plan, :plan_end, :status
  json.url user_url(user, format: :json)
end
