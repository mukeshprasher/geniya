json.array!(@menucategories) do |menucategory|
  json.extract! menucategory, :id, :name
  json.url menucategory_url(menucategory, format: :json)
end
