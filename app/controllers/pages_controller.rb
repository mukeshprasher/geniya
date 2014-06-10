class PagesController < ApplicationController
    def index
      @subscription = Subscription.new
      if signed_in?
        @activities = Activity.paginate(page: params[:page], per_page: 15)
        @update = current_user.updates.build
        @video = current_user.videos.build
        @advertisement = current_user.advertisements.build
        @feed_items = current_user.feed.paginate(page: params[:page], per_page: 5)
        @advertisements = Advertisement.all
        @organization = current_user.organizations.build
        @jobs = Array.new
        current_user.skills.each {|skill| skill.jobs.each{|job| @jobs << job } }
        @jobs = @jobs.uniq
        
        
        respond_to do |format|
          format.html
          format.js
        end      
      else
#        @top_users = User.all.limit(6).order('id asc')
        @top_users = User.where(feature_img: 'true').order(impressions_count: :desc)
        @video = Video.order(impressions_count: :desc).first
        @per_page = 15
        
        @albums = Array.new
        @categories.each do |category|
          category_albums = Album.where(kind: 'portfolio', category_id: category.id).order(impressions_count: :desc).limit(4)
          category_albums.each {|album| @albums << album}
        end
        #@albums = Album.paginate(page: params[:page], per_page: @per_page).where(kind: 'portfolio').order(impressions_count: :desc)
        respond_to do |format|
          format.html
          format.js
        end
      end
    end
    
    def price_table
    end
end
