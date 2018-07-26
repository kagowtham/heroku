class ItinerariesController < ApplicationController
  def index

  end

  def totals
    @user=current_user
    @itineraries = Itinerary.where(user_id:@user.id)
    @total=0
    @itineraries.each do |i|
      if i.accomadation_id != nil
        @accomadation = Accomadation.find(i.accomadation_id)
        @total+=@accomadation.price
      end
    end
    render json: @total
  end
end
