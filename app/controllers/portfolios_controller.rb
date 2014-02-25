class PortfoliosController < ApplicationController
  def index
    @albums = Album.where(:kind => "portfolio")
  end
  def category_index
    @category = Category.find(params[:id])
    @albums = Album.where(:category_id => @category.id, :kind => "portfolio")
  end
end
