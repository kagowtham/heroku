class LocationsController < ApplicationController
  def index
    render json: Location.all
  end

  def create
    @location = Location.new(user_params)
    if @location.save
      render json: @location
    else
      #render 'new'
    end
  end
  def withcountry
    @location = Location.new( params.permit(:country))
    render json: Location.find_by_country(params[:country])
  end
  private

  def user_params
    params.require(:location).permit(:country,:city,:spot)
  end
end
