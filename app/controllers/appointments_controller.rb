class AppointmentsController < ApplicationController

	before_action :set_appointment, :set_timediff,:set_timeslot, only: [:show, :update, :destroy]

 # GET /appointment
 def show
 	
 end

  # get appointments
  def index
  	a = avl_appt
  	render json: a
  end

  #Create appointment
  def create

  	if (check_timeslot(params[:date]))
  		if @appointment.save
  			render json: @appointment, status: :created
  		else
  			render json: @appointment.errors, status: :unprocessable_entity
  		end
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
  	days=string_day_to_array(Timeslot.where(:id => @timeslot).pluck(:day))
  	i=0
		while(i<14)
  		days.each do |d|
  			if (t.wday == d and check_timeslot(t))
  				twoweekdates.push(t)
  			end
  			t=t.next

  		end
  		return twoweekdates
  	end
  end

  def check_timeslot(date)

  	@timeslot = params[:timeslot_id]
  	c = Appointment.where(:timeslot_id => @timeslot).where(:date => params[:date]).count
  	if (@timediff-c*15>=15)
    	@appointment.BeginTime= Timeslot.find(@timeslot).pluck(BeginTime)+c*15.minutes#inmin do
    	@appointment.EndTime= @appointment.BeginTime+15.minutes#do in min
    	return true
    else
    	return false
    end
  end

  def set_appointment
  	@appointment = Appointment.find(params[:id])
  	#@appointment.BeginTime.strftime("%I:%M%p")
  	#@appointment.EndTime.strftime("%I:%M%p")
  end

  def set_timediff
  	@timediff=TimeDifference.between(params[:start_time], params[:end_time]).in_minutes
  end

  def string_day_to_array(day)
  	day = day.split('')
  	days = []
  	if d[0] == 1 then days.push("1")
  	end    
  	if d[1] == 1 then days.push("2")
  	end
  	if d[2] == 1 then days.push("3")
  	end
  	if d[3] == 1 then days.push("4")
  	end
  	if d[4] == 1 then days.push("5")
  	end
  	if d[5] == 1 then days.push("6")
  	end
  	return days
  end

  def set_timeslot
  	@timeslot= params[:timeslot_id]
  end
end

