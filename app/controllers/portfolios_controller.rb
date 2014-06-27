class PortfoliosController < ApplicationController
  def index
    @search_categories = @categories
    
    where_condition = "kind = 'portfolio' "

    if params.has_key?(:q) and params[:q].present?
      q = "'%#{params[:q]}%'".downcase
      where_condition += "and (LOWER(name) like #{q} or LOWER(title) like #{q}) "
    end

    if params.has_key?(:gr) and params[:gr].present?
      user_ids = Array.new
      params[:gr].each do |group_id|
        group = SubCategoryGroup.find(group_id.first)
        group.sub_categories.each do |sub_category|
          sub_category.users.each do |user|
            user_ids << user.id
          end
        end
      end

      if user_ids.any?
        user_ids_for_sql = user_ids.join(',')

        where_condition += "and user_id IN (#{user_ids_for_sql}) "
      else
        where_condition += "and user_id IN (0) "
      end
    end

    if params.has_key?(:pin) and params[:pin].present?
      code = params[:pin].gsub(/[^A-Za-z0-9]/, '')
      @pin = Pin.find_by(code: code)
      where_condition += "and pin_id = #{@pin.id} " unless @pin.nil?
    elsif params.has_key?(:city) and params[:city].present?
      city_name = params[:city].gsub(/[^A-Za-z]/, '').downcase
      @city = City.find_by(name: city_name)
      where_condition += "and city_id = #{@city.id} " unless @city.nil?
    end

    if params.has_key?(:country) and params[:country].present?
      @country = Country.find(params[:country])
      where_condition += "and country_id = #{params[:country]} " if !@country.nil?
    end

    if params.has_key?(:order) and params[:order].present?
      if params[:order] == 'recent'
        order = "created_at desc"
      elsif params[:order] == 'discussed'
        order = "comment_count desc"
      elsif params[:order] == 'liked'
        order = "like_count desc"
      elsif params[:order] == 'viewed'
        order = "impressions_count desc"
      else
        order = "impressions_count desc"
      end
    else
      order = "impressions_count desc"
    end

    @albums = Album.paginate(page: params[:page], per_page: 12).where(where_condition).order(order)
    @sql = Album.paginate(page: params[:page], per_page: 12).where(where_condition).order(order).to_sql
  end

  def category_index
    where_condition = "kind = 'portfolio' AND category_id = "
    @category = Category.find(params[:id])
    @search_categories = Category.where(id: @category.id)
    
    where_condition = "kind = 'portfolio' AND category_id = #{@category.id} "

    if params.has_key?(:q) and params[:q].present?
      q = "'%#{params[:q]}%'".downcase
      where_condition += "and (LOWER(name) like #{q} or LOWER(title) like #{q}) "
    end

    if params.has_key?(:sc) and params[:sc].present?
      user_ids = Array.new
      params[:sc].each do |sc_id|
        sub_category = SubCategory.find(sc_id.first)
        sub_category.users.each do |user|
          user_ids << user.id
        end
      end

      if user_ids.any?
        user_ids_for_sql = user_ids.join(',')

        where_condition += "and user_id IN (#{user_ids_for_sql}) "
      else
        where_condition += "and user_id IN (0) "
      end
    end

    if params.has_key?(:pin) and params[:pin].present?
      code = params[:pin].gsub(/[^A-Za-z0-9]/, '')
      @pin = Pin.find_by(code: code)
      where_condition += "and pin_id = #{@pin.id} " unless @pin.nil?
    elsif params.has_key?(:city) and params[:city].present?
      city_name = params[:city].gsub(/[^A-Za-z]/, '').downcase
      @city = City.find_by(name: city_name)
      where_condition += "and city_id = #{@city.id} " unless @city.nil?
    end

    if params.has_key?(:country) and params[:country].present?
      @country = Country.find(params[:country])
      where_condition += "and country_id = #{params[:country]} " unless @country.nil?
    end

    if params.has_key?(:order) and params[:order].present?
      if params[:order] == 'recent'
        order = "created_at desc"
      elsif params[:order] == 'discussed'
        order = "comment_count desc"
      elsif params[:order] == 'liked'
        order = "like_count desc"
      elsif params[:order] == 'viewed'
        order = "impressions_count desc"
      else
        order = "impressions_count desc"
      end
    else
      order = "impressions_count desc"
    end

    @albums = Album.paginate(page: params[:page], per_page: 12).where(where_condition).order(order)
  end
end
