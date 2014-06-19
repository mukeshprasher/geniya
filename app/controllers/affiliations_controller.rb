class AffiliationsController < ApplicationController
  before_action :set_affiliation, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [ :new, :edit, :create, :update, :destroy]
  before_action only: [:edit, :update, :destroy] do
    redirect_with_notice_if_incorrect_user(@affiliation)
  end


  # GET /affiliations
  # GET /affiliations.json
  def index
    @affiliations = Affiliation.all
  end

  # GET /affiliations/1
  # GET /affiliations/1.json
  def show
  end

  # GET /affiliations/new
  def new
    @affiliation = Affiliation.new
  end

  # GET /affiliations/1/edit
  def edit
  end

  # POST /affiliations
  # POST /affiliations.json
  def create
    @affiliation = Affiliation.new(affiliation_params)
    @affiliation.save
#    respond_to do |format|
#      if @affiliation.save
#        format.html { redirect_to @affiliation, notice: 'Affiliation was successfully created.' }
#        format.json { render action: 'show', status: :created, location: @affiliation }
#      else
#        format.html { render action: 'new' }
#        format.json { render json: @affiliation.errors, status: :unprocessable_entity }
#      end
#    end
  end

  # PATCH/PUT /affiliations/1
  # PATCH/PUT /affiliations/1.json
  def update
    respond_to do |format|
      if @affiliation.update(affiliation_params)
        format.html { redirect_to @affiliation, notice: 'Affiliation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @affiliation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /affiliations/1
  # DELETE /affiliations/1.json
  def destroy
    @affiliation.destroy
#    respond_to do |format|
#      format.html { redirect_to affiliations_url }
#      format.json { head :no_content }
#    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_affiliation
      @affiliation = Affiliation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def affiliation_params
      params.require(:affiliation).permit(:user_id, :organization_id, :sub_category_id, :start_date, :end_date, :status)
    end
end
