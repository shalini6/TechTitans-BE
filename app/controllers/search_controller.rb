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

	def services
		result1 = Diagnostic.
		result2 = Disease.where("disease LIKE ?", "%#{search}%")
		result3 = Disease.where("disease LIKE ?", "%#{search}%")
	end

	def doctor

	end
end
