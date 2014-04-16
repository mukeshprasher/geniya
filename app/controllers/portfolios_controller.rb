class PortfoliosController < ApplicationController
  def index
    @albums = Album.paginate(page: params[:page], per_page: 9).where(:kind => "portfolio")
  end
  def category_index
    @category = Category.find(params[:id])
    @albums = Album.paginate(page: params[:page], per_page: 3).where(:category_id => @category.id, :kind => "portfolio")
  end
end
