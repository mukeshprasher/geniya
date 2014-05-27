class PagesController < ApplicationController
    def index
      @subscription = Subscription.new
      if signed_in?
        @update = current_user.updates.build
        @video = current_user.videos.build
        @advertisement = current_user.advertisements.build
        @feed_items = current_user.feed.paginate(page: params[:page], per_page: 5)
        @advertisements = Advertisement.all
        respond_to do |format|
          format.html
          format.js
        end      
      else
        @top_users = User.paginate(page: params[:top_users_page], per_page: 6)
        @video = Video.order(impressions_count: :desc).first
        @per_page = 48
        @albums = Album.paginate(page: params[:page], per_page: @per_page).where(kind: 'portfolio').order(impressions_count: :desc)
        respond_to do |format|
          format.html
          format.js
        end
      end
    end
    
    def price_table
    end
end
