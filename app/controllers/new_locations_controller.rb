class NewLocationsController < ApplicationController
  def index
    if params[:id] !=nil
      @loc=Location.find(params[:id])
      @user=current_user
      render json:Location.joins(:selects).where(country: @loc.country,city: @loc.city, selects:{user_id: @user.id})

    elsif params[:removeid] !=nil
      @loc=Location.find(params[:removeid])
      @user=current_user
      Select.where(user_id: @user.id,location_id: @loc.id).destroy_all
      render json:Location.joins(:selects).where(country: @loc.country,city: @loc.city, selects:{user_id: @user.id})
    elsif params[:putid] !=nil
      @loc=Location.find(params[:putid])
      @user=current_user
      render json:Location.joins(:selects).where(country: @loc.country,city: @loc.city, selects:{user_id: @user.id})
    end
  end
end
