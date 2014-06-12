require 'factory_girl_rails'

And(/^the Email field should have "(.*?)"$/) do |field_value|
  find_field('Email').value.should eq field_value
end

And(/^the Name field should have "(.*?)"$/) do |field_value|
  find_field('Name').value.should eq field_value
end

And /^(?:|I )fill in all the user fields$/ do
  fill_in 'Name', :with => 'Foo Bar'
  fill_in 'Email', :with => 'foo.bar@foobar.com'
  fill_in 'Password', :with => 'foobar123'
  fill_in 'Confirmation', :with => 'foobar123'
end


And /^(?:|I )fill in all user fields except name$/ do
  fill_in 'Email', :with => 'foo.bar@foobar.com'
  fill_in 'Password', :with => 'foobar123'
  fill_in 'Confirmation', :with => 'foobar123'
end

And /^(?:|I )should see the user fields$/ do  ||
  steps %{
  And there should be a button Create my account
  And there should be a field Name
  And there should be a field Email
  And there should be a field Password
  And there should be a field Confirmation
  }
end

Given /^I am an existing user$/ do
  @new_user = FactoryGirl.create(:user)
  puts @new_user.id
end

And /^(?:|there )should be a field (.+)$/ do |button_name|
  find_field (button_name)
end

And /^I am visiting the user_edit page$/ do 
  visit edit_user_path(@new_user)
end

And /^(?:|I )should see the user edit fields$/ do  ||
  steps %{
  And there should be a button Save changes
  And there should be a field Name
  And there should be a field Email
  And there should be a field Password
  And there should be a field Confirm Password
  }
end
