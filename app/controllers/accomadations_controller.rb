class AccomadationsController < ApplicationController

  def index
    render json: Accomadation.all
  end

  def create
    @accomadation = Accomadation.new(user_params)
    if @accomadation.save
      render json: @accomadation
    else
      #render 'new'
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
