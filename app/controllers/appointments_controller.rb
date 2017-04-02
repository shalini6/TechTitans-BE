class AppointmentsController < ApplicationController

	before_action :set_timeslotid, only: [:show, :update, :destroy]

 # GET /appointment
 def show
 	a = avl_appt
 	render json: a
 end

  # get appointments
  def index
  	
  end

  #Create appointment
  def create
  	if check_timeslot(params[:date],params[:timeslot_id])
  		@a=Appointment.new(:patient_id =>params[:patient_id],:timeslot_id =>params[:timeslot_id],:BeginTime=>@Begin,:EndTime=>@End,:date =>params[:date],:mode =>params[:mode])

  		if @a.save
  			render json: @a, status: :created
  		else
  			render json:  @a.errors, status: :unprocessable_entity
  		end
  	else
  		render json: {
  		error: "No Available Appointments!",
  		status: 400
  		}, status: 400
  	end
  end

  def receipt
  	app_id=params[:appointment_id]
  	obj ={}
  	a = Appointment.find(app_id)
  	patient = Patient.find(a[:patient_id])
  	timeslot = Timeslot.find(a[:timeslot_id])
  	doctor = Clinical.find(timeslot[:service_id])
  	ins = Institution.find(timeslot[:institution_id])
  	obj['first_name']=patient[:first_name]
  	obj['last_name']=patient[:last_name]
  	obj['mobile']=patient[:mobile]
  	obj['email']=patient[:email]
  	if timeslot[:service] == "d"
  		obj['doctor_name']="Diagnostic Service"
  	else
  		obj['doctor_name']=doctor[:doctor_name]
  	end
		obj['department']=doctor[:department]
		if timeslot[:service] == "d"
  		obj['speciality_name']="NIL"
  	else
  		obj['speciality_name']=doctor[:speciality_name] 
  	end
  	obj['institution_name']=ins[:name]
  	obj['rate']= Rate.where(:service => timeslot[:service]).where(:service_id => timeslot[:service_id]).find_by(:institution_id => timeslot[:institution_id])
  	obj['BeginTime']= a[:BeginTime]
  	obj['EndTime']= a[:EndTime]
  	render json: obj
	end

  #def history

  private

  def avl_appt

  	t=Date.today
  	twoweekdates = []
  	d =Timeslot.find(params[:id]).as_json
  	days = string_day_to_array(d['day'])
  	14.times do
  		days.each do |day|
				if t.wday == day.to_i
					if check_timeslot(t,params[:id])
						twoweekdates.push(t)
					end
				end
			end
  		t=t.next	
  	end
  	return twoweekdates
  end

  def check_timeslot(d,id)
  	
  	c =Appointment.where(:timeslot_id => id).where(:date => d).count
  	  	set_timediff(id)
  	 if (@timediff.to_i-c*15>=15)
  	  a = Timeslot.select(:BeginTime).find(id).as_json
			@Begin = a['BeginTime']+c*15.minutes
    	@End= @Begin+15.minutes
    	return true
    else
    	return false
    end
  end

  def set_timeslotid
  	@timeslotid = params[:id]
  	
  	#@appointment.BeginTime.strftime("%I:%M%p")
  	#@appointment.EndTime.strftime("%I:%M%p")
  end

  def set_timediff(id)
  	start_time = Timeslot.select(:BeginTime).find(id).as_json
  	end_time = Timeslot.select(:EndTime).find(id).as_json
  	seconds_diff = end_time['EndTime'] - start_time['BeginTime']
  	@timediff = (seconds_diff / 60).round
  	seconds_diff -= @timediff * 60
  	seconds = seconds_diff
  end

  def string_day_to_array(day)
  	d = day.split('')
  	days = []
  	if d[0] == "1" then days.push("1")
  	end    
  	if d[1] == "1" then days.push("2")
  	end
  	if d[2] == "1" then days.push("3")
  	end
  	if d[3] == "1" then days.push("4")
  	end
  	if d[4] == "1" then days.push("5")
  	end
  	if d[5] == "1" then days.push("6")
  	end
  	return days
  end

end
