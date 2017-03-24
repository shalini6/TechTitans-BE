class Institution < ApplicationRecord
  has_secure_password

  has_one :location
  has_many :specialities

  def get_details
    details = {}
    details['institution'] = as_json
    details['specialities'] = specialities
    details['location'] = location
    details
  end
end
