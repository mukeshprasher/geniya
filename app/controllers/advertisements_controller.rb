class AdvertisementsController < ApplicationController
  before_action :set_advertisement, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:new, :edit, :create, :update, :destroy]
  before_action only: [:edit, :update, :destroy] do
    redirect_with_notice_if_incorrect_user(@advertisement)
  end

  # GET /advertisements
  # GET /advertisements.json
  def index
    @advertisements = Advertisement.all
    if params[:q]
      @advertisements = Advertisement.where("lower(title) like lower(?)", "%#{params[:q]}%")
    else  
      @advertisements = Advertisement.paginate(page: params[:page], :per_page => 20)
    end     
  end

  # GET /advertisements/1
  # GET /advertisements/1.json
  def show
    @advertisement = Advertisement.find(params[:id])
    @user = @advertisement.user
#    impressionist @advertisement, '', unique: [:user_id] if current_user
    @likers = @advertisement.likers(User)
    @comments = @advertisement.comment_threads.where('parent_id IS NULL').order('created_at desc')
    if signed_in?
      @new_comment = Comment.build_from(@advertisement, current_user.id, "")
    end  
  end

  # GET /advertisements/new
  def new
    @advertisement = Advertisement.new
    @advertisement.category = current_user.category
  end

  # GET /advertisements/1/edit
  def edit
  end

  # POST /advertisements
  # POST /advertisements.json
  def create
    @advertisement = Advertisement.new(advertisement_params)
    @advertisement.user_id = current_user.id
#    @advertisement.save
    respond_to do |format|
      if @advertisement.save
        format.html { 
          if advertisement_params.has_key?(:file_attachment)
            render 'crop'  
          else
            redirect_to @advertisement, notice: 'Advertisement was successfully created.'
          end    
        } 
        format.json { render action: 'show', status: :created, location: @advertisement }       
      else
        format.html { render action: 'new' }
        format.json { render json: @advertisement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /advertisements/1
  # PATCH/PUT /advertisements/1.json
  def update
    if params.has_key?(:advertisement) and params[:advertisement].has_key?(:file_attachment_original_w)
      #params[:advertisement][:file_attachment_box_w] = 1000
      if params[:advertisement][:file_attachment_original_w].to_f > 1000
        scale_factor = params[:advertisement][:file_attachment_original_w].to_f / 1000
        params[:advertisement][:file_attachment_crop_x] = params[:advertisement][:file_attachment_crop_x].to_f * scale_factor
        params[:advertisement][:file_attachment_crop_y] = params[:advertisement][:file_attachment_crop_y].to_f * scale_factor
        params[:advertisement][:file_attachment_crop_w] = params[:advertisement][:file_attachment_crop_w].to_f * scale_factor
        params[:advertisement][:file_attachment_crop_h] = params[:advertisement][:file_attachment_crop_h].to_f * scale_factor
      end
    end

    respond_to do |format|
      if @advertisement.update(advertisement_params)
        format.html { 
          if advertisement_params.has_key?(:file_attachment)
            render 'crop'  
          else        
            redirect_to @advertisement, notice: 'Advertisement was successfully updated.' 
          end
        }         
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @advertisement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /advertisements/1
  # DELETE /advertisements/1.json
  def destroy
    @advertisement.destroy
    respond_to do |format|
      format.html { redirect_to advertisements_url }
      format.json { head :no_content }
      format.js {  }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advertisement
      @advertisement = Advertisement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def advertisement_params
      params.fetch(:advertisement, {}).permit!
#      params.require(:advertisement).permit(:name, :address, :contact, :file_attachment, :title, :slogan, :description, :link)
    end
end
