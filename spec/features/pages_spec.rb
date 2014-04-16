require 'spec_helper'

describe 'header' do
  before { visit root_url }
  it 'should have "Login" link' do
    expect(page).to have_link "Login"
end
