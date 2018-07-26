class AccomadationsController < ApplicationController

  def index
    if params[:location_id] != nil
      @location=Location.find(params[:location_id])
       render json: Accomadation.where(city:@location.city,country: @location.country)
    else
       # @accomadation=Accomadation.find(params[:id])
       # render json: Accomadation.where(:country => @accomadation.country,:city => @accomadation.city,:spot => @accomadation.spot)
       render json: Accomadation.all
    end
  end

  def create
    @accomadation = Accomadation.new(user_params)
    @location=Location.find_by(country: @accomadation.country,city: @accomadation.city,spot: @accomadation.spot)
    print(@location)
    @accomadation.location=@location
    if @accomadation.save
      render json: @accomadation
    else
      render json: @location
    end
  end
  def show
    render json: Accomadation.find(params[:id])
  end
  private

  def user_params
    params.require(:accomadation).permit(:name, :country,:city, :spot,:price)
  end



end
