
FactoryGirl.define do
  factory :accomodation do
    description Faker::Lorem.sentence
    price 50.55
    location Faker::Address.city
    room_type Faker::Lorem.word
    number_of_beds Faker::Number.digit
  end
end
