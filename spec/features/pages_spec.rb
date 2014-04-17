require 'spec_helper'

feature 'homepage' do
  before { visit root_url }

  it 'should have appropriate title' do
    expect(page).to have_title "RoomShare"
  end

  it 'should have a search field' do
    expect(page).to have_button "Search"
  end

  describe 'header' do
    it '"Login" link should take you to the proper page' do
      click_link 'Login'
      expect(page).to have_title "Login | RoomShare"
    end

    it '"Sign up" link should take you to the proper page' do
      click_link 'Sign up'
      expect(page).to have_title "Sign up | RoomShare"
    end

    it 'should have a "RoomShare" link' do
      click_link 'RoomShare'
      expect(page).to have_title "RoomShare"
    end
  end

  describe 'using search form' do
    it 'should return existing accomodations matching the form query' do
      create_user_and_create_accomodation
      visit root_url
      fill_in "search", with: "#{@user.accomodations.first.location}"
      click_button "Search"
      expect(page).to have_content "#{@user.accomodations.first.location}"
    end

    it 'should return an error message if there are no matching accomodations' do
      click_button "Search"
      expect(page).to have_content "Sorry, there are no avaliable accomodations."
    end
  end
end

feature 'signup' do
  before { visit new_user_registration_path }

  it 'should have the appropriate title' do
    expect(page).to have_title "Sign up | RoomShare"
  end

  describe 'using valid information' do
    it 'should allow the user to create an account' do
      user = FactoryGirl.build(:user)
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      fill_in "Password confirmation", with: user.password
      click_button "Sign up"
      expect(page).to have_content ("Welcome! You have signed up successfully.")
    end
  end

  describe 'using invalid information' do
    it 'will display an error if email field is left blank' do
      click_button "Sign up"
      expect(page).to have_content ("Email can't be blank")
      expect(page).to have_content ("Password can't be blank")
    end

    it 'require proper format in the email field' do
      fill_in "Email", with: "hankathello.com"
      fill_in "Password", with: "foobarbaz"
      fill_in "Password confirmation", with: "foobarbaz"
      expect(page).not_to have_content ("Welcome! You have signed up successfully.")
    end
  end
end

feature 'login' do
  before { visit new_user_session_path }

  it 'should have the appropriate title' do
    expect(page).to have_title "Login | RoomShare"
  end

  describe 'using valid information' do
    it 'should allow an existing user to sign in' do
      create_and_signin_user
      expect(page).to have_content ("Edit profile")
    end
  end


  describe 'using invalid information' do
    it 'will display an error if email or password field is left blank' do
      click_button "Login"
      expect(page).to have_content ("Invalid email or password.")
    end

    it 'will display an error if email or password field is not correct' do
      fill_in "Email", with: "hankathello.com"
      fill_in "Password", with: "foobarbaz"
      click_button "Login"
      expect(page).to have_content ("Invalid email or password.")
    end
  end
end

feature 'logout' do
  before { create_and_signin_user }
  it 'should allow users to log out of their accounts' do
    click_link "Logout"
    expect(page).to have_content ("Logged out successfully.")
  end
end

feature 'user_show' do
  before { create_and_signin_user }
  before { visit user_path(@user) }

  it 'should allow registered users to visit their show page' do
    expect(page).to have_content ("Post a new accomodation")
  end

  it 'should have the appropriate title' do
    expect(page).to have_title ("#{@user.email} | RoomShare")
  end

  describe 'visiting another users show page' do
    it 'should not display link to create accomodation' do
      @user_one = FactoryGirl.create(:user)
      visit user_path(@user_one)
      expect(page).to_not have_content "Post a new accomodation"
    end
  end

  describe 'when entering valid information' do
    it 'should allow the user to post a new accomodation' do
      click_link "Post a new accomodation"
      fill_in "Description", with: "Scary House"
      fill_in "Price", with: 45.95
      fill_in "Location", with: "New Jersey"
      fill_in "Room type", with: "Mansion"
      fill_in "Number of beds", with: 17
      click_button "Create Accomodation"
      expect(page).to have_content ("Scary House")
    end
  end
  describe 'when entering invalid information' do
    it 'will display errors if any fields are blank' do
      click_link "Post a new accomodation"
      click_button "Create Accomodation"
      expect(page).to have_content "Location can't be blank"
    end
  end
end


