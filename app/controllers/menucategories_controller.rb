class MenucategoriesController < ApplicationController
  before_action :set_menucategory, only: [:show, :edit, :update, :destroy]

  # GET /menucategories
  # GET /menucategories.json
  def index
    @menucategories = Menucategory.all
  end

  # GET /menucategories/1
  # GET /menucategories/1.json
  def show
  end

  # GET /menucategories/new
  def new
    @menucategory = Menucategory.new
  end

  # GET /menucategories/1/edit
  def edit
  end

  # POST /menucategories
  # POST /menucategories.json
  def create
    @menucategory = Menucategory.new(menucategory_params)

    respond_to do |format|
      if @menucategory.save
        format.html { redirect_to @menucategory, notice: 'Menucategory was successfully created.' }
        format.json { render action: 'show', status: :created, location: @menucategory }
      else
        format.html { render action: 'new' }
        format.json { render json: @menucategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menucategories/1
  # PATCH/PUT /menucategories/1.json
  def update
    respond_to do |format|
      if @menucategory.update(menucategory_params)
        format.html { redirect_to @menucategory, notice: 'Menucategory was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @menucategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menucategories/1
  # DELETE /menucategories/1.json
  def destroy
    @menucategory.destroy
    respond_to do |format|
      format.html { redirect_to menucategories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menucategory
      @menucategory = Menucategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menucategory_params
      params.require(:menucategory).permit(:name)
    end
end
