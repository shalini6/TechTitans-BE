class PatientsController < ApplicationController
  def index
    @patients = patient.all
    respond_with(@patients) do |f|
      f.json{ render :json => @patients.as_json}
      f.html
  end

  def new
    @patient = Patient.new(patient_params)
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      flash[:notice] = "Patient registered successfully"
    else
      render('new')
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])
    if @patient.update_attributes(patient_params)
      flash[:notice] = "Details updated"
      redirect_to(:action => 'show', :id => @patient.id)
    else
      render('edit')
  end

  def delete
    @patient =Patient.find(params[:id])

  end

  def destroy
    patient = Patient.find(params[:id].destroy)
    flash[:notice] = "Patient '#{patient.fn}' destroyed"
  end
end
