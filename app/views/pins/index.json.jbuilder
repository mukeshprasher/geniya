json.array!(@pins) do |pin|
  json.extract! pin, :id, :code, :city_id
  json.url pin_url(pin, format: :json)
end
