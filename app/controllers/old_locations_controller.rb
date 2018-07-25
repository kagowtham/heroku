class OldLocationsController < ApplicationController
  def index

    if params[:id] != nil
       @loc=Location.find(params[:id])
       @l =Location.where(country: @loc.country, city: @loc.city)
       @user=current_user
       Select.delete(Select.where(user_id: @user.id))
       render json:Location.left_outer_joins(:selects).where(country: @loc.country,city: @loc.city, selects:{user_id: nil,location_id:nil})
    elsif params[:removeid] !=nil
       @loc=Location.find(params[:removeid])
       @user=current_user
       Select.create(user_id:@user.id,location_id:@loc.id)
       render json:Location.left_outer_joins(:selects).where(country: @loc.country,city: @loc.city, selects:{user_id: nil,location_id:nil})
    elsif params[:putid] != nil
      @loc=Location.find(params[:putid])
      render json:Location.left_outer_joins(:selects).where(country: @loc.country,city: @loc.city, selects:{user_id: nil,location_id:nil})
    end
  end

  def create

  end
  def show

  end
end
