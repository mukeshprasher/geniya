module CategoriesHelper
  def set_categories
    @categories = Category.all.order(order: :asc)
  end
end
