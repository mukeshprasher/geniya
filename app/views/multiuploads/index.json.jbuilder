json.array!(@multiuploads) do |multiupload|
  json.extract! multiupload, :id, :name, :album_id
  json.url multiupload_url(multiupload, format: :json)
end
