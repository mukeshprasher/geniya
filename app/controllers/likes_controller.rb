class LikesController < ApplicationController
  
  def create
    @object = params[:like][:likeable_type].constantize.find(params[:like][:likeable_id])
    current_user.like!(@object)
  end

  def destroy
    @like = Like.find(params[:id])
    @object = @like.likeable_type.constantize.find(@like.likeable_id)
    @like.destroy
  end
end
