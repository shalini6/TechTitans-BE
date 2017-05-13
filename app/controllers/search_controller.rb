class SearchController < ApplicationController

	def institutions
		results = Institution.select(:name, :rating, :id).as_json
		results.each do |result|
			insti = Institution.find(result['id'])
			result['location'] = insti.location.as_json(except: [:created_at, :updated_at, :institution_id, :id])
			result['specialities'] = insti.clinicals.pluck(:speciality_name).uniq
		end
		render json: results
	end

	def doctors
		results = Clinical.select(:doctor_name, :id, :speciality_name, :department).as_json
		results.each do |result|
			doc = Clinical.find(result['id'])
			result['institution_name'] = doc.institution.name
			result['location'] = doc.institution.location.as_json(except: [:created_at, :updated_at, :institution_id, :id])
			result['fee'] = doc
		end
		render json: results
	end

	def services
		results = []

		result1 = Institution.all
		result1.each do |insti|
			speciality = insti.clinicals.select(:speciality_name).distinct
			speciality.each do |sp|
				insti.clinicals.where(:speciality_name => sp.speciality_name).each do |c|
					obj = {}
					obj['name'] = sp.speciality_name
					obj['institution_name'] = insti.name
					obj['rating'] = insti.rating
					obj['type'] = 's'
					obj['id'] = c.id
					obj['location'] = insti.location.as_json(except: [:created_at, :updated_at, :institution_id, :id])
					obj['department'] = insti.clinicals.select(:department).where(:speciality_name => sp.speciality_name)
					obj['department'].each do |dept|
						dept = department_itos(dept)
					end
					results << obj
				end
			end
		end

		result2 = Disease.all
		result2.each do |disease|
			result1 = Institution.all
			result1.each do |insti|
				speciality = insti.clinicals.pluck(:speciality_name).distinct
				if speciality.include? disease.speciality
					obj = {}
					obj['name'] = disease.speciality
					obj['institution_name'] = insti.name
					obj['rating'] = insti.rating
					obj['type'] = 'c'
					obj['id'] = insti.id
					obj['location'] = insti.location.as_json(except: [:created_at, :updated_at, :institution_id, :id])
					obj['department'] = insti.clinicals.select(:department).where(:speciality_name => disease.speciality)
					obj['department'].each do |dept|
						dept = department_itos(dept)
					end
					results << obj
				end
			end
		end

		result3 = Diagnostic.all
		result3.each do |diag|
			result1 = Institution.all
			result1.each do |insti|
				if insti.rates.where(:service_id => diag.id).where(:service => 'd').exists?
					obj = {}
					obj['name'] = diag.name
					obj['institution_name'] = insti.name
					obj['rating'] = insti.rating
					obj['type'] = 'd'
					obj['id'] = diag.id
					obj['location'] = insti.location.as_json(except: [:created_at, :updated_at, :institution_id, :id])
					obj['department'] = nil
					results << obj
				end
			end
		end

	render json: results
	end

	def department_itos(dept)
	 department = ""
	 case dept
	  when 0 then department = "AYURVEDIC"
	  when 1 then department = "YOGA"
	  when 2 then department = "UNANI"
	  when 3 then department = "SIDDHA"
	  when 4 then department = "HOMEOPATHY"
	 end
	return department
	end
end
