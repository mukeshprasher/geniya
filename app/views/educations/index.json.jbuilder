json.array!(@educations) do |education|
  json.extract! education, :id, :institute_name, :course_name, :start_date, :end_date
  json.url education_url(education, format: :json)
end
