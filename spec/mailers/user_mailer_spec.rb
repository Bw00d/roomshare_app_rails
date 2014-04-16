require 'spec_helper'

describe UserMailer do
  it "sends a welcome email when a new account is created" do
    user = FactoryGirl.build(:user)
    user.send_welcome_message
    ActionMailer::Base.deliveries.last.to.should == [user.email]
  end
end
