class InstitutionsController < ApplicationController
  before_action :set_institution, only: [:show, :update, :destroy]
  wrap_parameters format: [:json], include: Institution.attribute_names + [:password, :password_confirmation]

  def login
    response = {}
    i =Institution.find_by(:user_id => params[:institution_id])
    if i
      if i.authenticate(params[:password])
        response['message'] = "Success"
        response['id'] = i.id
      else
        response['message'] = "Invalid Password"
      end
    else
      response['message'] = "Invalid Username"
    end
    render json: response
  end


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
     render json:  @institution.errors, status: :unprocessable_entity
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

  #Appointment history of institutions
  def history
    history = []
    timeslotsid= Institution.find(params[:institution_id]).timeslots
    timeslotsid.each do |d|
      a = (Appointment.where(:timeslot_id => d['id']).order('date desc')).as_json(except: [:timeslot_id, :created_at, :updated_at])
      a.each do |s|

        if s['date']>Date.today
          s['status']=1
        elsif s['date']<Date.today
          s['status']=0
        elsif s['date']=Date.today and s['BeginTime'].strftime("%H:%M:%S")>Time.now.strftime("%H:%M:%S")
          s['status']=1
        else
          s['status']=0
        end
        history.push(s)
      end
    end
    render json: history
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_institution
    @institution = Institution.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def institution_params
    params.fetch(:institution, {}).permit(:password, :password_confirmation, :name, :about, :photo, :email, :contact_number, :website, :user_id)
  end
end
