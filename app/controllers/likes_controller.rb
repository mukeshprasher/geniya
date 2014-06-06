class LikesController < ApplicationController
  before_action :signed_in_user, only: [ :create, :destroy]

  def create
    @object = params[:like][:likeable_type].constantize.find(params[:like][:likeable_id])
    current_user.like!(@object)
    create_activity(@object.class.name, @object.id, 'like') unless params[:like][:likeable_type] == 'Comment'
    
    # For Picture, Album, Comment, Reply, Video, Organization or Status update
    create_response(@object, 'like')
  end

  def destroy
    @like = Like.find(params[:id])
    @object = @like.likeable_type.constantize.find(@like.likeable_id)
    @like.destroy
    destroy_activity(@object.class.name, @object.id, 'like')
    destroy_response(@object, 'like')
  end
end
