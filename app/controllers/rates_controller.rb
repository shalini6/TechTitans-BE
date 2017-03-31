class RatesController < ApplicationController
before_action :set_rate, only: [:show, :update, :destroy]

#GET /rates
def show
  render json: @rate
end

#GET rates
def index
  @rates = Rate.all
  render json: @rates
end


#POST /rates
def create
 @rate = Rate.new(rate_params)

   if @rate.save
     render json: @rate, status: :created
   else
    render json: @rate.errors, status: :unprocessable_entity
  end
end  

#PATCH/PUT /rate
def update
  if @rate.update(rate_params)
    render json: @rate
  else
    render json: @rate.errors, status: :unprocessable_entity
  end
end

def destroy
  @rate.destroy
end        
private
  # Use callbacks to share common setup or constraints between actions.
  def set_rate
    @rate = Rate.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def rate_params
    params.fetch(:rate, {}).permit(:service, :service_id, :institution_id, :rate)
  end

end
