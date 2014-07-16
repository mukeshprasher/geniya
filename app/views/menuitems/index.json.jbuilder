json.array!(@menuitems) do |menuitem|
  json.extract! menuitem, :id, :name, :price, :description
  json.url menuitem_url(menuitem, format: :json)
end
