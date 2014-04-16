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

