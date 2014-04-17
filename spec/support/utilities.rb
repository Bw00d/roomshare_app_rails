def sign_in
  fill_in "Email", :with => @user.email
  fill_in "Password", :with => @user.password
  click_button 'Login'
end

def create_and_signin_user
  visit root_path
  @user = FactoryGirl.create(:user)
  visit new_user_session_path
  sign_in
end

def create_user_and_create_accomodation
  create_and_signin_user
  click_link @user.email
  click_link "Dashboard"
  click_link "Post a new accomodation"
  fill_in "Description", with: "Scary House"
  fill_in "Price", with: 45.95
  fill_in "Location", with: "New Jersey"
  fill_in "Room type", with: "Mansion"
  fill_in "Number of beds", with: 17
  click_button "Create Accomodation"
end
