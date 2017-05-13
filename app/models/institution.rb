class Institution < ApplicationRecord
  has_secure_password

  has_one :location
  has_many :clinicals
  has_many :appointments
  has_many :rates
  has_many :patients, through: :appointments
  has_many :timeslots

  def get_details
    details = {}
    details['institution'] = self.as_json(except: [:created_at, :updated_at, :rating, :password_digest])
    details['location'] = location(except: [:created_at, :updated_at])
    details
  end
end
