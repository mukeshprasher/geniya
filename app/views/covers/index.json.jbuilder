json.array!(@covers) do |cover|
  json.extract! cover, :id, :name
  json.url cover_url(cover, format: :json)
end
