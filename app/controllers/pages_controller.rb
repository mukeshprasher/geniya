class PagesController < ApplicationController
    def index
      @subscription = Subscription.new
      if signed_in?
        @update = current_user.updates.build
        @feed_items = current_user.feed.paginate(page: params[:page])
      end
    end
    
    def price_table
    end
end
