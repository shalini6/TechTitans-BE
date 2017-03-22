class Institution < ApplicationRecord
	has_secure_password

	has_one :location
end
