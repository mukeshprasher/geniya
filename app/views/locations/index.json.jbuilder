json.array!(@locations) do |location|
  json.extract! location, :id, :city_id, :pin_id, :street_address, :longitude, :latitude
  json.url location_url(location, format: :json)
end
