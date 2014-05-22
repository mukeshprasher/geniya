json.array!(@designations) do |designation|
  json.extract! designation, :id, :name
  json.url designation_url(designation, format: :json)
end
