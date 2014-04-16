#roomshare_app
Rails 4.0.4
pairs Corey Norris & Brentwood Reid
###Epicodus exercise

This is an room share application styled of airBandB or couchsurfer. The purpose of this exercise is to become more proficient with Rails.  We will be utilizing Devise for user authorization and Rspec, Capybara and FactoryGirl for testing. We will practice ActionMailer and will implement ajax where practical for UX.

* The user can now create an account. (feature tested)
* The user will now receive a confirmation email. (feature tested)
* The user will be able to post an accomodation
* The user will be able to browse accomodations by location
* The user will be able to book and accomodation


### Testing mailer
Please don't put mailcatcher into your Gemfile. It will conflict with your applications gems at some point.

Instead, pop a note in your README stating you use mailcatcher. Simply run gem install mailcatcher then mailcatcher to get started.
