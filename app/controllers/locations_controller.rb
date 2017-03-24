class LocationsController < ApplicationController
  before_action :set_institution, only: [:create, :show]
  before_action :set_location, only: [:update]

  # GET /locations
  def index
  	response = Location.uniq.pluck(:city, :state, :institution_id)
  	render json: response
  end

  # GET /locations/1
  def show
  	response = @institution.location
  	render json: response
  end

  # POST /locations
  def create
    @location = Location.new(location_params)
    @institution.location = @location

    if @location.save
      render json: @location, status: :created
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /locations/1
  def update
    if @location.update(location_params)
      render json: @location
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end

  # DELETE /locations/1
  # No need for this call
  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_institution
      @institution = Institution.find(params[:institution_id])
    end

    def set_location
      @location = Location.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def location_params
      params.fetch(:location, {}).permit(:address, :city, :state, :pin)
    end
end
