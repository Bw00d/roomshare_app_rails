require 'spec_helper'

feature 'homepage' do
  before { visit root_url }

  it 'should have appropriate title' do
    expect(page).to have_title "RoomShare"
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
end

feature 'signup' do
  before { visit new_user_registration_path }

  it 'should have the appropriate title' do
    expect(page).to have_title "Sign up | RoomShare"
  end

  it 'should allow the user to create an account' do
    user = FactoryGirl.build(:user)
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password
    click_button "Sign up"
    expect(page).to have_content ("Welcome! You have signed up successfully.")
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
end
















