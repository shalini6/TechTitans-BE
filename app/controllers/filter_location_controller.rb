class FilterLocationController < ApplicationController

def create
 #to empty the table
 FilterLocation.find_each(&: destroy)
 params[:I_id].each do |id|
  @location = Location.find_by(:institution_id id)
  FilterLocation.create(@location)
 end
 if params[:location].present?
      @result = FilterLocation.near(params[:location], params[:distance] || 10, order: :distance)
 else
      @results = FilterLocation.all

 end
 render json: @results.not_geocoded

end
