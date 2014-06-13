class PortfoliosController < ApplicationController
  def index
    @search_categories = @categories
    
    where_condition = "kind = 'portfolio' "

    if params.has_key?(:q) and params[:q].present?
      q = "'%#{params[:q]}%'"
      where_condition += "and (name like #{q} or title like #{q}) "
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

      user_ids_for_sql = user_ids.join(',')

      where_condition += "and user_id IN (#{user_ids_for_sql}) "
    end

    if params.has_key?(:city) and params[:city].present?
      city_name = params[:city].gsub(/[^A-Za-z]/, '').downcase
      city = City.find_by(name: city_name)
      where_condition += "and city_id = #{city.id} " unless city.nil?
    end

    if params.has_key?(:country) and params[:country].present?
      where_condition += "and country_id = #{params[:country]} "
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

    @albums = Album.paginate(page: params[:page], per_page: 12).where(ActiveRecord::Base::sanitize(where_condition)).order(order)
    @sql = Album.paginate(page: params[:page], per_page: 12).where(where_condition).order(order).to_sql
  end
  def category_index
    @category = Category.find(params[:id])
    @search_categories = Category.where(id: @category.id)

    if !params[:q].nil?
      q = "%#{params[:q]}%"
      
      @albums = (Album.where("category_id = ? and name   like ? and kind=?", @category.id, q, 'portfolio').order(impressions_count: :desc) | Album.where("category_id = ? and title like ? and kind=?", @category.id, q, 'portfolio').order(impressions_count: :desc) | Album.where("category_id = ? and description like ? and kind=?", @category.id, q, 'portfolio').order(impressions_count: :desc) ).uniq
    elsif !params[:sc].nil?
      @albums = Array.new
      params[:sc].each do |sc_id|
        sub_category = SubCategory.find(sc_id.first)
        sub_category.users.each do |user|
          user.albums.where(kind: 'portfolio').each do |album|
            @albums << album
          end
        end
      end
      @albums.sort! { |a, b|  b.impressions_count <=> a.impressions_count }
    else
      @albums = Album.paginate(page: params[:page], per_page: 12).where(:category_id => @category.id, :kind => "portfolio")
    end
  end
end
