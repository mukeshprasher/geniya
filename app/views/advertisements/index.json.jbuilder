json.array!(@advertisements) do |advertisement|
  json.extract! advertisement, :id, :name, :address, :contact
  json.url advertisement_url(advertisement, format: :json)
end
