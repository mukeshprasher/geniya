class PagesController < ApplicationController
    def index
      @subscription = Subscription.new
      if signed_in?
        listning_to_user_ids_for_sql_in = (current_user.connected_user_ids + current_user.followed_user_ids).uniq.join(',')
        @ids = listning_to_user_ids_for_sql_in
        if listning_to_user_ids_for_sql_in.length == 0
          @activities = Activity.paginate(page: params[:page], per_page: 15).order(created_at: :desc)
        else
          @activities = Activity.where("`user_id` IN ( #{listning_to_user_ids_for_sql_in} ) ").paginate(page: params[:page], per_page: 15).order(created_at: :desc)
          @sql = Activity.where("`user_id` IN ( #{listning_to_user_ids_for_sql_in} ) ").paginate(page: params[:page], per_page: 15).order(created_at: :desc).to_sql
        end
        
        @update = current_user.updates.build
        @video = current_user.videos.build
        @advertisement = current_user.advertisements.build
        @feed_items = current_user.feed.paginate(page: params[:page], per_page: 5)
        @advertisements = Advertisement.all
        @organization = current_user.organizations.build
        @jobs = Array.new
        current_user.skills.each {|skill| skill.jobs.each{|job| @jobs << job } }
        @jobs = @jobs.uniq
        @advertize = Advertisement.where.not(user_id: current_user.id)
        @ads = @advertize.where(category_id: current_user.category_id)
        
        
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
          category_albums = Album.where(kind: 'portfolio', category_id: category.id).order(impressions_count: :desc).limit(8)
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
