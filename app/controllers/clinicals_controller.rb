  class ClinicalsController < ApplicationController
  before_action :set_institution, only: [:create, :show]
  before_action :set_clinical, only: [:update, :destroy]

  # GET /clinicals
  def index
    tmp = Clinical.all
    response = []
    tmp.each do |clinical|
      obj = {}
      obj['speciality_name'] = clinical['speciality_name']
      obj['clinicals'] = clinical.as_json(except: [:created_at, :updated_at, ] )
      response << obj
    end
    render json: response
  end

  # GET /clinicals/1
  def show
    response = @institution.clinicals
    render json: response
  end

  # POST /clinicals
  def create
    params[:clinicals].each do |clinical|
      @clinical = Clinical.new()
      @clinical.speciality_name = clinical['speciality_name']
      @clinical.doctor_name = clinical['doctor_name']
      @clinical.department = clinical['department']
      @institution.clinicals << @clinical
      @clinical.save
    end

    render json: @institution.clinicals
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
  def destroy
    @clinical.destroy
  end

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
    params.fetch(:clinical, {}).permit(:speciality_name, :doctor_name, :department, clinicals: [:speciality_name, :doctor_name, :department])
  end
end
