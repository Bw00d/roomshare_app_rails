class AccomodationsController < ApplicationController

  def index

  end

  def show
    @accomodation = Accomodation.find(params[:id])
  end

  def new
    @accomodation = Accomodation.new
  end

  def create
    @user = current_user
    @accomodation = Accomodation.create(accomodations_params)
    if @accomodation.save
      @user.accomodations << @accomodation
      redirect_to user_path(@user)
    else
      render new_accomodation_path
    end
  end

private
    def accomodations_params
      params.require(:accomodation).permit(:location, :room_type,
                                           :price, :number_of_beds)
    end
end

