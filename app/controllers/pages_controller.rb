class PagesController < ApplicationController
    def index
      @subscription = Subscription.new
      if signed_in?
        @update = current_user.updates.build
        @advertisement = current_user.advertisements.build
        @feed_items = current_user.feed.paginate(page: params[:page], per_page: 5)
        respond_to do |format|
          format.html
          format.js
        end      
      else
        @albums = Album.paginate(page: params[:page], per_page: 21).where(kind: 'portfolio').order(impressions_count: :desc)
        respond_to do |format|
          format.html
          format.js
        end
      end
    end
    
    def price_table
    end
end
