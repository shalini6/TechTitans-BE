class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :update, :destroy]
  wrap_parameters format: [:json], include: Patient.attribute_names + [:password, :password_confirmation]

  def login
    response = {}
    p = Patient.find_by(:mobile => params[:patient_id])
    if p
      if p.authenticate(params[:password])
        response['message'] = "Success"
      else
        response['message'] = "Invalid Password"
      end
    else
      response['message'] = "Invalid Username"
    end
    render json: response
  end

  # GET /patient
  def show
    render json: @patient
  end

  # get patients
  def index
    @patients = Patient.all

    render json: @patients
  end

  # POST /patient
  def create
    @patient = Patient.new(patient_params)

    if @patient.save
      render json: @patient, status: :created
    else
      render json: @patient.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /patient
  def update
    if @patient.update(patient_params)
      render json: @patient
    else
      render json: @patient.errors, status: :unprocessable_entity
    end
  end

  # DELETE /patient
  def destroy
    @patient.destroy
  end

  #Appointment history
  def appointment
    @appointments = Appointment.where(:patient_id => params[:patient_id]).as_json(except: [:timeslot_id, :created_at, :updated_at])
    @appointments.each do |d|
      if d['date']>Date.today
          d['status']=1
        elsif d['date']<Date.today
          d['status']=0
        elsif d['date']=Date.today and d['BeginTime'].strftime("%H:%M:%S")>Time.now.strftime("%H:%M:%S")
          d['status']=1
        else
          d['status']=0
        end
    end
      render json: @appointments
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_patient
    @patient = Patient.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def patient_params
    params.fetch(:patient, {}).permit(:first_name, :last_name, :mobile, :password, :gender, :dob, :address, :b_grp, :email, :aadhar, :password, :password_confirmation)
  end
end
