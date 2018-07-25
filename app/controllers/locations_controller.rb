class LocationsController < ApplicationController
  def index
    if params[:group] != nil
      if params[:country] != nil
        render json: Location.where(country: params[:country]).group(params[:group])
      else
        render json:Location.group(params[:group])
      end


    else
    render json: Location.all
    end
  end

  def create
    @location = Location.new(user_params)
    if @location.save
      render json: @location
    else
      #render 'new'
    end
  end
  def destroy

    render json: Location.all
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
