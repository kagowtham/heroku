class AccomadationsController < ApplicationController

  def index
    if params[:country] != nil
       render json: Location.joins(:accomadations).where(country: params[:country]).select('accomadations.id,accomadations.country,accomadations.city,accomadations.spot,accomadations.name,accomadations.price').group(:spot),each_serializer:LocationJoinSerializer
    else
       @accomadation=Accomadation.find(params[:id])
       render json: Accomadation.where(:country => @accomadation.country,:city => @accomadation.city,:spot => @accomadation.spot)
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
