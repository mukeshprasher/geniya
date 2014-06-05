class CoversController < ApplicationController
  before_action :set_cover, only: [:show, :edit, :update, :destroy]

  # GET /covers
  # GET /covers.json
  def index
    @covers = Cover.all
  end

  # GET /covers/1
  # GET /covers/1.json
  def show
  end

  # GET /covers/new
  def new
    @cover = Cover.new
  end

  # GET /covers/1/edit
  def edit
  end

  # POST /covers
  # POST /covers.json
  def create
    if params[:cover][:special_attribute] == 'covershot'
      @current_user_cover_pics = current_user.covers.where(upload_type: 'cover')
      @current_user_cover_pics.each do |s|
        if s.special_attribute == 'covershot'
          s.update_attribute(:special_attribute, '')
          s.save
        end
      end    
    end
    
    @cover = Cover.new(cover_params)
    @cover.user_id = current_user.id
    @cover.save

    render 'crop'
  end

  # PATCH/PUT /covers/1
  # PATCH/PUT /covers/1.json
  def update
    respond_to do |format|
      if @cover.update_attributes(cover_params)
        format.html { redirect_to current_user, notice: 'Cover Pic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cover.errors, status: :unprocessable_entity }
      end
    end
  end

#  def crop
#    @upload = Upload.find(params[:id])
#  end

  # DELETE /covers/1
  # DELETE /covers/1.json
  def destroy
    @cover.destroy
    respond_to do |format|
      format.html { redirect_to covers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cover
      @cover = Cover.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cover_params
      params.fetch(:cover, {}).permit!
#      params.require(:cover).permit(:name, :file_attachment, :title)
    end
end
