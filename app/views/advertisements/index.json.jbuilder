json.array!(@advertisements) do |advertisement|
  json.extract! advertisement, :id, :name, :address, :contact, :title, :file_attachment
  json.url advertisement_url(advertisement, format: :json)
  json.category advertisement.category.name
  json.image_url advertisement.file_attachment.url(:medium)
end
