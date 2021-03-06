class AccomodationsController < ApplicationController

  def index
    @accomodations = Accomodation.where(location: params[:search])
  end

  def show
    @accomodation = Accomodation.find(params[:id])
  end

  def new
    @accomodation = Accomodation.new
  end

  def create
    @user = current_user
    @accomodation = Accomodation.new(accomodations_params)
    if @accomodation.save
      @user.accomodations << @accomodation
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

private
    def accomodations_params
      params.require(:accomodation).permit(:description, :location, :room_type,
                                           :price, :number_of_beds, :search)
    end
end
