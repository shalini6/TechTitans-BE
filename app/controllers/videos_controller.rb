class VideosController < ApplicationController
before_action :set_video, only: [:show, :update, :destroy]

#when patient click start button  
# GET /video
  def show
    response = @video.as_json
    @video.room_key = nil
    @video.save
    render json: response

  end

# When doctor click the start button
 # PATCH/PUT /video
  def update
    if @video.update(video_params)
      render json: @video
    else
      render json: @video.errors, status: :unprocessable_entity
    end
  end

#When any of the two click finish 
 # DELETE /video
  def destroy
    @video.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_video
    @video = Video.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def video_params
    params.fetch(:video, {}).permit(:clinicals_id, :patients_id, :room_key, :prescription)
  end
end
