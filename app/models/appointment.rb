class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :timeslot
  belongs_to :institution
end
