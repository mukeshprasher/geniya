json.array!(@featureimgs) do |featureimg|
  json.extract! featureimg, :id, :name
  json.url featureimg_url(featureimg, format: :json)
end
