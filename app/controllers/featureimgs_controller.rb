class FeatureimgsController < ApplicationController
  before_action :set_featureimg, only: [:show, :edit, :update, :destroy]

  # GET /featureimgs
  # GET /featureimgs.json
  def index
    @featureimgs = Featureimg.all
  end

  # GET /featureimgs/1
  # GET /featureimgs/1.json
  def show
  end

  # GET /featureimgs/new
  def new
    @featureimg = Featureimg.new
  end

  # GET /featureimgs/1/edit
  def edit
  end

  # POST /featureimgs
  # POST /featureimgs.json
  def create
    if current_user.featureimg.nil?
    else
      current_user.featureimg.delete
    end
    @featureimg = Featureimg.new(featureimg_params)
    respond_to do |format|
      if @featureimg.save
#        format.html { redirect_to @featureimg, notice: 'Featureimg was successfully created.' }
        format.html { render action: 'crop' }
      else
        format.html { render action: 'new' }
        format.json { render json: @featureimg.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /featureimgs/1
  # PATCH/PUT /featureimgs/1.json
  def update
    respond_to do |format|
      if @featureimg.update(featureimg_params)
        format.html { redirect_to current_user, notice: 'Feature Image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @featureimg.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /featureimgs/1
  # DELETE /featureimgs/1.json
  def destroy
    @featureimg.destroy
    respond_to do |format|
      format.html { redirect_to featureimgs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_featureimg
      @featureimg = Featureimg.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def featureimg_params
      params.fetch(:featureimg, {}).permit!
#      params.require(:featureimg).permit(:name, :user_id, :feature_img)
    end
end
