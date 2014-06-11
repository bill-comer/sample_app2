require 'factory_girl_rails'


Given /^I am an existing user$/ do
  @new_user = FactoryGirl.create(:user)
  puts @new_user.id
end

And /^(?:|there )should be a button (.+)$/ do |button_name|
  find_button (button_name)
end

And /^(?:|there )should be a field (.+)$/ do |button_name|
  find_field (button_name)
end

And /^(?:|I )click on the button (.+)$/ do |button_name|
  click_button (button_name)
end