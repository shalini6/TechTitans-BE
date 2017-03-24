class Institution < ApplicationRecord
	has_secure_password

	has_one :location
	has_many :specialities

	def get_details
		details = {}
		details['institution'] = self.as_json
		details['specialities'] = self.specialities
		details['location'] = self.location
		details
	end
end
