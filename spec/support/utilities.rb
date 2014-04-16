def sign_in
  click_link 'Log in'
  fill_in "email", :with => "Mac@hello.com"
  fill_in "Password", :with => "foobarbaz"
  click_button 'Sign in'
end

def create_and_signin_user
  visit root_url
  @user = create(:user)
  sign_in
end
