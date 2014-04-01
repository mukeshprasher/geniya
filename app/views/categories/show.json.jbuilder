json.extract! @category, :id, :name
json.sub_category_groups @category.sub_category_groups do |sub_category_group|
  json.name sub_category_group.name
  json.sub_categories sub_category_group.sub_categories do |sub_category|
    json.id sub_category.id
    json.name sub_category.name
  end
end
