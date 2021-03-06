class MenuitemsController < ApplicationController
  before_action :set_menuitem, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [ :new, :edit, :create, :update, :destroy, :index]
  # GET /menuitems
  # GET /menuitems.json
  def index
    @menuitems = Menuitem.all.paginate(page: params[:page], :per_page => 20)
  end

  # GET /menuitems/1
  # GET /menuitems/1.json
  def show
  end

  # GET /menuitems/new
  def new
    if current_user.menucategories.any?
      @menuitem = Menuitem.new
    else
      redirect_to new_menucategory_path, notice: 'Please add the category for add an item.'
    end
  end

  # GET /menuitems/1/edit
  def edit
  end

  # POST /menuitems
  # POST /menuitems.json
  def create
    if current_user.menucategories.any?
      @menuitem = Menuitem.new(menuitem_params)
      @menuitem.user_id = current_user.id

      respond_to do |format|
        if @menuitem.save
          format.html { redirect_to current_user, notice: 'Menu item was successfully created.' }
          format.json { render action: 'show', status: :created, location: @menuitem }
        else
          format.html { render action: 'new' }
          format.json { render json: @menuitem.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to new_menucategory_path, notice: 'Please add the category for add an item.'
    end
  end

  # PATCH/PUT /menuitems/1
  # PATCH/PUT /menuitems/1.json
  def update
    respond_to do |format|
      if @menuitem.update(menuitem_params)
        format.html { redirect_to current_user, notice: 'Menu item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @menuitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menuitems/1
  # DELETE /menuitems/1.json
  def destroy
    @menuitem.destroy
#    respond_to do |format|
#      format.html { redirect_to menuitems_url }
#      format.json { head :no_content }
#    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menuitem
      @menuitem = Menuitem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menuitem_params
      params.require(:menuitem).permit(:name, :price, :description, :menucategory_id)
    end
end
