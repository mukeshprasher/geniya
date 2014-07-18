json.array!(@quotes) do |quote|
  json.extract! quote, :id, :name, :email, :contact, :message
  json.url quote_url(quote, format: :json)
end
