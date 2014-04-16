# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
    sequence :email do |n|
    Faker::Internet.safe_email
  end

  factory :user do
    email
    password 'foobarbaz'
    password_confirmation 'foobarbaz'
  end
end
