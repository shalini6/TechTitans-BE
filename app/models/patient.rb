class Patient < ApplicationRecord
  has_secure_password

  has_many :appointments
  has_many :institutions, through: :appointments
  has_many :videos

  # EMAIL_CHK= /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
  # MOBILE_CHK= /\d[0-9]\)*\z/
  # AADHAR_CHK= /\d[0-9]\)*\z/
end
