class Patient < ApplicationRecord



	EMAIL_CHK= /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
	MOBILE_CHK= /\d[0-9]\)*\z/
	AADHAR_CHK= /\d[0-9]\)*\z/
	validates_presence_of :first_name
	validates_length_of :first_name, :maximum => 50
	validates_presence_of :last_name
	validates_length_of :last_name, :maximum => 50
	validates_presence_of :mobile
	validates_format_of :mobile, :with =>MOBILE_CHK
	validates_length_of :mobile, :is => 10
	validates_uniqueness_of :mobile
	#validates_length_of :email, :maximum => 100
	#validates_format_of :email, :with =>EMAIL_CHK
	#validates :aadhar, :length =>{:is => 12},
	#					:format => {:with => AADHAR_CHK}

end
  