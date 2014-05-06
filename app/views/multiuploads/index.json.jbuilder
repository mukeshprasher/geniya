json.array!(@multiuploads) do |multiupload|
  json.extract! multiupload, :id, :name
  json.url multiupload_url(multiupload, format: :json)
end
