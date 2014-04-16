class PortfoliosController < ApplicationController
  def index
    if !params[:q].nil?
      q = "%#{params[:q]}%"
      
      @albums_by_name = Album.where("name   like ? and kind=?", q, 'portfolio').order(impressions_count: :desc)
      @albums_by_title = Album.where("title like ? and kind=?", q, 'portfolio').order(impressions_count: :desc)
      @albums_by_description = Album.where("description like ? and kind=?", q, 'portfolio').order(impressions_count: :desc)
      
      @albums = @albums_by_name + @albums_by_title + @albums_by_description
    else
      @albums = Album.where(:kind => "portfolio").order(impressions_count: :desc)
    end
  end
  def category_index
    @category = Category.find(params[:id])

    if !params[:q].nil?
      q = "%#{params[:q]}%"
      
      @albums_by_name = Album.where("category_id = ? and name   like ? and kind=?", @category.id, q, 'portfolio').order(impressions_count: :desc)
      @albums_by_title = Album.where("category_id = ? and title like ? and kind=?", @category.id, q, 'portfolio').order(impressions_count: :desc)
      @albums_by_description = Album.where("category_id = ? and description like ? and kind=?", @category.id, q, 'portfolio').order(impressions_count: :desc)
      
      @albums = @albums_by_name + @albums_by_title + @albums_by_description
    else
      @albums = Album.where(:category_id => @category.id, :kind => "portfolio")
    end
  end
end
