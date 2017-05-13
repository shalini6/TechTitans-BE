class TimeslotsController < ApplicationController
before_action :set_timeslot, only: [:show, :update, :destroy]


#GET /timeslots
def show
  render json: @timeslot
end

#GET timeslots
def index
  @timeslots = Timeslot.all
  @timeslots.each do |i|
   i.day = string_day_to_array(i.day) 
  puts ("Hello")
  end
  render json: @timeslots
end


#POST /timeslot
def create
 @timeslot = Timeslot.new(timeslot_params)

   if @timeslot.save
     render json: @timeslot, status: :created
   else
    render json: @timeslot.errors, status: :unprocessable_entity
  end
end  

#PATCH/PUT /timeslot
def update
  if @timeslot.update(timeslot_params)
    render json: @timeslot
  else
    render json: @timeslot.errors, status: :unprocessable_entity
  end
end

def destroy
  @timeslot.destroy
end        

private
  # Use callbacks to share common setup or constraints between actions.
  def set_timeslot
    @timeslot = Timeslot.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def timeslot_params
    params.fetch(:timeslot, {}).permit(:institution_id, :service, :service_id, :day, :BeginTime, :EndTime)
  end


 def string_day_to_array(day)
  d = day.split('')
  days = []
  if d[0] == "1" then days.push("Monday")
   end    
  if d[1] == "1" then days.push("Tuesday")
   end
  if d[2] == "1" then days.push("Wednesday")
   end
  if d[3] == "1" then days.push("Thursday")
   end
  if d[4] == "1" then days.push("Friday")
   end
  if d[5] == "1" then days.push("Saturday")
   end
 return days
 end

 def array_day_to_string(day)
  days = ""
  day.each do |d|
   if d === nil then days += "0"
   else days += "1"
   end
  end
  return days
 end
end
