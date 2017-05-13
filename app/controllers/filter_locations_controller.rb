class FilterLocationsController < ApplicationController
def create
 #to empty the table
 FilterLocation.find_each(&:destroy)
 params[:institution_id].each do |id|
 @location = Location.find_by_institution_id(id)
 @obj = FilterLocation.create(@location.as_json)
 @distance = @obj.distance_from([params[:latitude], params[:longitude]])
 @obj.distance = @distance
 @obj.save   
 end
 @results = FilterLocation.order(:distance)
 render json: @results
end
private
def data_params
    params.fetch({}).permit(:institution_id, :latitude,:longitude)
  end

end
