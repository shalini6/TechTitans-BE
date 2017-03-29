class ClinicalsController < ApplicationController
  before_action :set_institution, only: [:create, :show]
  before_action :set_clinical, only: [:update]

  # GET /clinicals
  def index
    response = Clinical.uniq.pluck(:clinical_name, :institution_id)
    render json: response
  end

  # GET /clinicals/1
  def show
    response = @institution.clinicals
    render json: response
  end

  # POST /clinicals
  def create
    @clinical = Clinical.new(clinical_params)
    @institution.clinicals << @clinical

    if @clinical.save
      render json: @clinical, status: :created
    else
      render json: @clinical.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /clinicals/1
  def update
    if @clinical.update(clinical_params)
      render json: @clinical
    else
      render json: @clinical.errors, status: :unprocessable_entity
    end
  end

  # DELETE /clinicals/1
  # No need for this call
  def destroy; end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_institution
    @institution = Institution.find(params[:institution_id])
  end

  def set_clinical
    @clinical = Clinical.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def clinical_params
    params.fetch(:clinical, {}).permit(:speciality_name, :doctor_name, :experience, :department)
  end
end
