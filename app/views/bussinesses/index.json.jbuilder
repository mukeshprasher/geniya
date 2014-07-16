json.array!(@bussinesses) do |bussiness|
  json.extract! bussiness, :id, :summary, :agenda, :services, :about, :industry, :website, :contact, :headquarter, :companysize, :founded
  json.url bussiness_url(bussiness, format: :json)
end
