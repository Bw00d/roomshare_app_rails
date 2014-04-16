class AccomodationsController < ApplicationController


private
    def accomodations_params
      params.require(:accomodation).permit(:owner_id, :location, :room_type,
                                           :price, :number_of_beds)
    end
end

