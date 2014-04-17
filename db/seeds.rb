# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)




def make_ny
    ny = FactoryGirl.create(:accomodation, location: "New York")
    @user.accomodations << ny
end
  def make_paris
      paris = FactoryGirl.create(:accomodation, location: "Paris")
      @user.accomodations << paris
end
def make_tokyo
    tokyo = FactoryGirl.create(:accomodation, location: "Tokyo")
    @user.accomodations << tokyo
end



  10.times do |n|
    email = Faker::Internet.safe_email
    password = "foobarbaz"
    @user = FactoryGirl.create(:user, email: email, password: password,
                 password_confirmation: password)
    make_ny
    make_paris
    make_tokyo
  end

