json.array!(@organizations) do |organization|
  json.extract! organization, :id, :name, :cateogry_id, :start_date, :address_id, :user_id
  json.url organization_url(organization, format: :json)
end
