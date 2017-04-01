class AppointmentsController < ApplicationController

	before_action :set_timeslotid, :set_timediff, only: [:show, :update, :destroy]

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

  	if @appointment.save
  		render json: @appointment, status: :created
  	else
  	render json: {
  		error: "No Available Appointments!",
  		status: 400
  		}, status: 400
  	end
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
					if check_timeslot(t)
						twoweekdates.push(t)
					end
				end
			end
  		t=t.next	
  	end
  	return twoweekdates
  end

  def check_timeslot(d)

  	c =Appointment.where(:timeslot_id => params[:id]).where(:date => d).count
  	  	
  	 if (@timediff-c*15>=15)
  	  a = Timeslot.select(:BeginTime).find(params[:id]).as_json
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

  def set_timediff
  	start_time = Timeslot.select(:BeginTime).find(@timeslotid).as_json
  	end_time = Timeslot.select(:EndTime).find(@timeslotid).as_json
  	seconds_diff = end_time['EndTime'] - start_time['BeginTime']
  	@timediff = (seconds_diff / 60).round
  	seconds_diff -= @timediff * 60
  	seconds = seconds_diff
  	puts(@timediff)
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

  # def set_appointment
  # 	@appointment=Appointment.new(:patient_id => )
  # end

end
