class SharesController < ApplicationController
  before_action :set_share, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:update, :destroy, :create]
  before_action only: [:edit, :update, :destroy] do
    redirect_with_notice_if_incorrect_user(@share)
  end

  # GET /shares
  # GET /shares.json
  def index
    @shares = Share.all
  end

  # POST /shares
  # POST /shares.json
  def create
    @object = share_params[:shared_type].constantize.find(share_params[:shared_id])

    if @object
      @share = Share.new(share_params)
      @share.user_id = current_user.id
      @share.save
    end

    create_activity(@object.class.name, @object.id, 'share', share_params[:comment])
    
    # For Picture, Album, Video or Status update
    create_response(@object, 'share')
#    respond_to do |format|
#      if @share.save
#        format.html { redirect_to @share, notice: 'Share was successfully created.' }
#        format.json { render action: 'show', status: :created, location: @share }
#      else
#        format.html { render action: 'new' }
#        format.json { render json: @share.errors, status: :unprocessable_entity }
#      end
#    end
  end

  # PATCH/PUT /shares/1
  # PATCH/PUT /shares/1.json
  def update
    respond_to do |format|
      if @share.update(share_params)
        format.html { redirect_to @share, notice: 'Share was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @share.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shares/1
  # DELETE /shares/1.json
  def destroy
    @share.destroy
    respond_to do |format|
      format.html { redirect_to shares_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_share
      @share = Share.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def share_params
      params.require(:share).permit(:user_id, :shared_type, :shared_id, :comment)
    end
end
