json.array!(@companies) do |company|
  json.extract! company, :id, :name, :title, :startmonth, :startyear, :endmonth, :endyear, :status, :description, :companylink
  json.url company_url(company, format: :json)
end
