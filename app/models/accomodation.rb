class Accomodation < ActiveRecord::Base
  has_and_belongs_to_many :users


  validates :location, presence: true
  validates :room_type, presence: true
  validates :price, presence: true
  validates :number_of_beds, presence: true

  def self.search(search)
    @accomodations = Accomodation.where(location: search)
  end
end
