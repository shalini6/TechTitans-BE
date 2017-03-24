class Patient < ApplicationRecord
	has_secure_password

	# EMAIL_CHK= /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
	# MOBILE_CHK= /\d[0-9]\)*\z/
	# AADHAR_CHK= /\d[0-9]\)*\z/

end

