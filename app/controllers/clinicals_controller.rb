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
      obj['doctors'] = clinical.as_json(except: [:created_at, :updated_at, ] )
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
    params[:services].each do |service|
      service[:doctors].each do |obj|
        @clinical = Clinical.new()
        @clinical.speciality_name = service[:speciality_name]
        @clinical.doctor_name = obj['doctor_name']
        @clinical.department = obj['department']
        @institution.clinicals << @clinical
        @clinical.save
      end
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

#Convert string to integer to store in backend
def department_stoi(department)
 case department
   when "AYURVEDIC" then dept = 0
   when "YOGA" then dept = 1
   when "UNANI" then dept = 2
   when "SIDDHA" then dept = 3
   when "HOMEOPATHY" then dept =4
  end
 return dept
end

#Concert integer to string in frontend
def department_itos(dept)
 department = ""
 case dept
  when 0 then department = "AYURVEDIC"
  when 1 then department = "YOGA"
  when 2 then department = "UNANI"
  when 3 then department = "SIDDHA"
  when 4 then department = "HOMEOPATHY"
 end
return department
end


# Use callbacks to share common setup or constraints between actions.
  def set_institution
    @institution = Institution.find(params[:institution_id])
  end

  def set_clinical
    @clinical = Clinical.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def clinical_params
    params.fetch(:clinical, {}).permit(:speciality_name, :doctor_name, :department, services: [:speciality_name, :doctor_name, :department])
  end
end
