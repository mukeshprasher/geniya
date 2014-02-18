class PortfoliosController < ApplicationController
  before_action :signed_in_user, except: [:index, :show]
  before_action :correct_user,   only: [:edit, :update, :destroy]
  def index
    @albums = Album.where(:kind => "portfolio")
  end

  def show
    @category = Category.find(params[:id])
  end
end
