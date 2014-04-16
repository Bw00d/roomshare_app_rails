class Accomodation < ActiveRecord::Base
  has_and_belongs_to_many :users

  validates :owner_id, presence: true
  validates :location, presence: true
  validates :room_type, presence: true
  validates :price, presence: true
  validates :number_of_beds, presence: true

  private
    def accomodations_params
      params.require(:accomodation).permit(:owner_id, :location, :room_type,
                                           :price, :number_of_beds)
    end
end
