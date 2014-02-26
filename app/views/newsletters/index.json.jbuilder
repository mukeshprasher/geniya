json.array!(@newsletters) do |newsletter|
  json.extract! newsletter, :id, :subject, :body, :status
  json.url newsletter_url(newsletter, format: :json)
end
