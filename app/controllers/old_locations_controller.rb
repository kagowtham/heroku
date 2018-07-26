class OldLocationsController < ApplicationController
  def index

    if params[:id] != nil
       @loc=Location.find(params[:id])
       @l =Location.where(country: @loc.country, city: @loc.city)
       @user=current_user
       Itinerary.delete(Itinerary.where(user_id: @user.id))
       render json:Location.left_outer_joins(:itineraries).where(country: @loc.country,city: @loc.city, itineraries:{user_id: nil,location_id:nil,accomadation_id:nil})
    elsif params[:removeid] !=nil
       @loc=Location.find(params[:removeid])
       @user=current_user
       @itinerary=Itinerary.new
       @itinerary.user_id=@user.id
       @itinerary.location_id=@loc.id
       @itinerary.save()
       render json:Location.left_outer_joins(:itineraries).where(country: @loc.country,city: @loc.city, itineraries:{user_id: nil,location_id:nil,accomadation_id:nil})
    elsif params[:putid] != nil
      @loc=Location.find(params[:putid])
      render json:Location.left_outer_joins(:itineraries).where(country: @loc.country,city: @loc.city, itineraries:{user_id: nil,location_id:nil,accomadation_id:nil})
    end
  end

  def create

  end
  def show

  end
end
