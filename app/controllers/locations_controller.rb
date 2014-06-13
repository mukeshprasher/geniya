class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  # GET /locations
  # GET /locations.json
  def index
    @locations = Location.all
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
  end

  # GET /locations/new
  def new
    @location = Location.new
  end

  # GET /locations/1/edit
  def edit
  end

  # POST /locations
  # POST /locations.json
  def create
    if params[:location][:country_id] == '0'
      if params[:location][:new_pin] == ''
        @country = Country.create!(name: params[:location][:new_country].downcase)
        @state = State.create!(country_id: @country.id, name: params[:location][:new_state].downcase)
        @city = City.create!(state_id: @state.id, name: params[:location][:new_city].downcase)
        @location = Location.new(location_params)
        @location.country_id = @country.id
        @location.state_id = @state.id
        @location.city_id = @city.id
        @location.save
      else
        @country = Country.create!(name: params[:location][:new_country].downcase)
        @state = State.create!(country_id: @country.id, name: params[:location][:new_state].downcase)
        @city = City.create!(state_id: @state.id, name: params[:location][:new_city].downcase)
        @pin = Pin.create!(city_id: @city.id, code: params[:location][:new_pin])
        @location = Location.new(location_params)
        @location.country_id = @country.id
        @location.state_id = @state.id
        @location.city_id = @city.id
        @location.pin_id = @pin.id
        @location.save      
      end
    elsif params[:location][:state_id] == '0'
      if params[:location][:new_pin] == ''
        @state = State.create!(country_id: params[:location][:country_id], name: params[:location][:new_state].downcase)
        @city = City.create!(state_id: @state.id, name: params[:location][:new_city].downcase)
        @location = Location.new(location_params)
        @location.state_id = @state.id
        @location.city_id = @city.id
        @location.save
      else
        @state = State.create!(country_id: params[:location][:country_id], name: params[:location][:new_state].downcase)
        @city = City.create!(state_id: @state.id, name: params[:location][:new_city].downcase)
        @pin = Pin.create!(city_id: @city.id, code: params[:location][:new_pin].downcase)
        @location = Location.new(location_params)
        @location.state_id = @state.id
        @location.city_id = @city.id
        @location.pin_id = @pin.id
        @location.save      
      end
    elsif params[:location][:city_id] == '0'
      if params[:location][:new_pin] == ''
        @city = City.create!(state_id: params[:location][:state_id], name: params[:location][:new_city].downcase)
        @location = Location.new(location_params)
        @location.city_id = @city.id
        @location.save
      else
        @city = City.create!(state_id: params[:location][:state_id], name: params[:location][:new_city].downcase)
        @pin = Pin.create!(city_id: @city.id, code: params[:location][:new_pin])
        @location = Location.new(location_params)
        @location.city_id = @city.id
        @location.pin_id = @pin.id
        @location.save      
      end       
    elsif params[:location][:pin_id] == '0'
      if params[:location][:new_pin] == ''
        @location = Location.new(location_params)
        @location.save
      else
        @pin = Pin.create!(city_id: params[:location][:city_id], code: params[:location][:new_pin])
        @location = Location.new(location_params)
        @location.pin_id = @pin.id
        @location.save
      end          
    else
      @location = Location.new(location_params)
      @location.save
    end

    add_location_to_user_albums(@location)

#    respond_to do |format|
#      if @location.save
#        format.html { redirect_to @location, notice: 'Location was successfully created.' }
#        format.json { render action: 'show', status: :created, location: @location }
#      else
#        format.html { render action: 'new' }
#        format.json { render json: @location.errors, status: :unprocessable_entity }
#      end
#    end
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location.destroy
#    respond_to do |format|
#      format.html { redirect_to locations_url }
#      format.json { head :no_content }
#    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:country_id, :state_id,:city_id, :pin_id, :street_address, :longitude, :latitude, :user_id, :organization_id, :status)
    end
end
