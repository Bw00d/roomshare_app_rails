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
  before { @user = FactoryGirl.create(:user) }

  it 'should have the appropriate title' do
    expect(page).to have_title "Sign up | RoomShare"
  end

  it 'should allow the user to create an account' do
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    fill_in "Password confirmation", with: @user.password
  end

end
