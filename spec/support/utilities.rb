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

def create_accomodation
  click_link "Post a new accomodation"
  @accomodation = FactoryGirl.create(:accomodation)
end
