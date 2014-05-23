json.array!(@affiliations) do |affiliation|
  json.extract! affiliation, :id, :user_id, :organization_id, :sub_category_id, :start_date, :end_date, :status
  json.url affiliation_url(affiliation, format: :json)
end
