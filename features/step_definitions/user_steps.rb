#require 'test/factories/factories.rb'
require 'factory_girl_rails'


Given /^I am an existing user$/ do
  @new_user = FactoryGirl.create(:user)
  puts @new_user.id
end