json.array!(@albums) do |album|
  json.extract! album, :id, :name, :title, :description, :kind
  json.url album_url(album, format: :json)
end
