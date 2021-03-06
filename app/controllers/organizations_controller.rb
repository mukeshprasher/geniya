class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [ :new, :edit, :create, :update, :destroy]
  before_action only: [:edit, :update, :destroy] do
    redirect_with_notice_if_incorrect_user(@organization)
  end



  # GET /organizations
  # GET /organizations.json
  def index
    @organizations = Organization.all
    if params[:q]
      @organizations = Organization.where("lower(name) like lower(?)", "%#{params[:q]}%")
    else  
      @organizations = Organization.paginate(page: params[:page], :per_page => 20)
    end
  end

  # GET /organizations/1
  # GET /organizations/1.json
  def show
    if signed_in?
      @affiliation = current_user.affiliations.build
    end
    @users = @organization.users.paginate(page: params[:page], :per_page => 15)
  end

  # GET /organizations/new
  def new
    @organization = Organization.new
  end

  # GET /organizations/1/edit
  def edit
  end

  # POST /organizations
  # POST /organizations.json
  def create
    @organization = Organization.new(organization_params)
    @organization.user_id = current_user.id

    respond_to do |format|
      if @organization.save
        format.html { redirect_to Organization, notice: 'Organization created, now add affiliation.' }
        format.json { render action: 'show', status: :created, location: @organization }
      else
        format.html { render action: 'new' }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organizations/1
  # PATCH/PUT /organizations/1.json
  def update
    respond_to do |format|
      if @organization.update(organization_params)
        format.html { redirect_to @organization, notice: 'Organization was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.json
  def destroy
    @organization.destroy
    respond_to do |format|
      format.html { redirect_to organizations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organization_params
      params.require(:organization).permit(:name, :category_id, :start_date, :address_id)
    end
end
