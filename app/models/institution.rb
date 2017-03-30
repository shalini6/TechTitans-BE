class Institution < ApplicationRecord
  has_secure_password

  has_one :location
  has_many :clinicals
  has_many :appointments
  has_many :patients, through: :appointments

  def get_details
    details = {}
    details['institution'] = self.as_json
    details['clinicals'] = self.clinicals
    details['location'] = location
    details
  end
end
