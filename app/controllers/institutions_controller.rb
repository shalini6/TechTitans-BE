class InstitutionsController < ApplicationController
  before_action :set_institution, only: [:show, :update, :destroy]
  wrap_parameters format: [:json], include: Institution.attribute_names + [:password, :password_confirmation]

  # GET /institutions
  def index
    @institutions = Institution.all
    response = []
    @institutions.each do |institute|
      response << institute.get_details
    end
    puts response
    render json: response
  end

  # GET /institutions/1
  def show
    response = @institution.get_details
    render json: response
  end

  # POST /institutions
  def create
    @institution = Institution.new(institution_params)

    if @institution.save
      render json: @institution, status: :created
    else
      render json: @institution.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /institutions/1
  def update
    if @institution.update(institution_params)
      render json: @institution
    else
      render json: @institution.errors, status: :unprocessable_entity
    end
  end

  # DELETE /institutions/1
  def destroy
    @institution.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_institution
    @institution = Institution.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def institution_params
    params.fetch(:institution, {}).permit(:password, :password_confirmation, :name, :about, :photo, :email, :contact_number, :website)
  end
end
