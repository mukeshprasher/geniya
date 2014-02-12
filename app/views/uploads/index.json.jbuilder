json.array!(@uploads) do |upload|
  json.extract! upload, :id, :portfolio_id, :name, :title, :description, :file_attachment, :file_type, :extension
  json.url upload_url(upload, format: :json)
end
