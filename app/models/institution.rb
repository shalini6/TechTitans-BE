class Institution < ApplicationRecord
  has_secure_password

  has_one :location
  has_many :specialities
  has_many :appointments
  has_many :patients, through: :appointments

  def get_details
    details = {}
    details['institution'] = as_json
    details['specialities'] = specialities
    details['location'] = location
    details
  end
end
