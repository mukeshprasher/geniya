json.array!(@usertags) do |usertag|
  json.extract! usertag, :id, :name
  json.url usertag_url(usertag, format: :json)
end
