class TimeslotsController < ApplicationController


private
 def string_day_to_array(day)
  day = day.split('')
  days = []
  if d[0] == 1 then days.push("Monday")
   end    
  if d[1] == 1 then days.push("Tuesday")
   end
  if d[2] == 1 then days.push("Wednesday")
   end
  if d[3] == 1 then days.push("Thursday")
   end
  if d[4] == 1 then days.push("Friday")
   end
  if d[5] == 1 then days.push("Saturday")
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
