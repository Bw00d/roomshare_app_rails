require 'spec_helper'

describe Accomodation do

  it { should have_and_belong_to_many :users }
  it { should validate_presence_of :owner_id }
  it { should validate_presence_of :room_type }
  it { should validate_presence_of :location }
  it { should validate_presence_of :number_of_beds }
  it { should validate_presence_of :price }

end
