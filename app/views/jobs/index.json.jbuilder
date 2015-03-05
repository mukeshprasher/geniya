json.array!(@jobs) do |job|
  json.extract! job, :id, :user_id, :organization_id, :category_id, :sub_category_id, :reference_code, :title, :description, :minimum_experience, :maximum_experience, :minimum_salary, :maximum_salary, :employment_type, :employment_status, :cover
  json.url job_url(job, format: :json)
  json.category job.category.name
  json.image_url job.cover.url(:medium)
end
