json.array!(@countries) do |country|
  json.extract! country, :id, :name, :region, :timezone
  json.url country_url(country, format: :json)
end
