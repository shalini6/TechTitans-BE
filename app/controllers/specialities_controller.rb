class SpecialitiesController < ApplicationController
  before_action :set_institution, only: [:create, :show]
  before_action :set_speciality, only: [:update]

  # GET /specialities
  def index
    response = Speciality.uniq.pluck(:speciality_name, :institution_id)
    render json: response
  end

  # GET /specialities/1
  def show
    response = @institution.specialities
    render json: response
  end

  # POST /specialities
  def create
    @speciality = Speciality.new(speciality_params)
    @institution.specialities << @speciality

    if @speciality.save
      render json: @speciality, status: :created
    else
      render json: @speciality.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /specialities/1
  def update
    if @speciality.update(speciality_params)
      render json: @speciality
    else
      render json: @speciality.errors, status: :unprocessable_entity
    end
  end

  # DELETE /specialities/1
  # No need for this call
  def destroy; end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_institution
    @institution = Institution.find(params[:institution_id])
  end

  def set_speciality
    @speciality = Speciality.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def speciality_params
    params.fetch(:speciality, {}).permit(:speciality_name, :doctor_name, :experience, :rating, :discipline)
  end
end
