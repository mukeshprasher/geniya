class PortfoliosController < ApplicationController
  def index
    @search_categories = @categories
    if !params[:q].nil?
      q = "%#{params[:q]}%"
      
      @albums = (
        Album.where("name   like      ? and kind=?", q, 'portfolio').order(impressions_count: :desc) | 
        Album.where("title like       ? and kind=?", q, 'portfolio').order(impressions_count: :desc) | 
        Album.where("description like ? and kind=?", q, 'portfolio').order(impressions_count: :desc)
      ).uniq
    elsif !params[:gr].nil?
      @albums = Array.new
      params[:gr].each do |group_id|
        group = SubCategoryGroup.find(group_id.first)
        group.sub_categories.each do |sub_category|
          sub_category.users.each do |user|
            user.albums.where(kind: 'portfolio').each do |album|
              @albums << album
            end
          end
        end
      end
      @albums.sort! { |a, b|  b.impressions_count <=> a.impressions_count }
    else
      @albums = Album.paginate(page: params[:page], per_page: 12).where(:kind => "portfolio").order(impressions_count: :desc)
    end
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
