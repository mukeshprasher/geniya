class MenucategoriesController < ApplicationController
  before_action :set_menucategory, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [ :new, :edit, :create, :update, :destroy, :index]
  # GET /menucategories
  # GET /menucategories.json
  def index
    @menucategories = Menucategory.all.paginate(page: params[:page], :per_page => 20)
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
    searched_menucat = Menucategory.find_by(name: params[:menucategory][:name])
    menucategory = (searched_menucat) ? searched_menucat : Menucategory.new(menucategory_params)
    menucategory.users << current_user unless menucategory.users.include? current_user
    menucategory.save
    redirect_to current_user
  end

  # PATCH/PUT /menucategories/1
  # PATCH/PUT /menucategories/1.json
  def update
    respond_to do |format|
      if @menucategory.update(menucategory_params)
        format.html { redirect_to current_user, notice: 'Menucategory was successfully updated.' }
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
#    respond_to do |format|
#      format.html { redirect_to menucategories_url }
#      format.json { head :no_content }
#    end
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
