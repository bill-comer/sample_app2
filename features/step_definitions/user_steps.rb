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

And /^(?:|I )fill in all the user edit fields with new values$/ do
  fill_in 'Name', :with => 'Foo Bar new'
  fill_in 'Email', :with => 'foo.bar@foobarnew.com'
  fill_in 'Password', :with => 'foobar123new'
  fill_in 'Confirm Password', :with => 'foobar123new'
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

And /^create another user$/ do
  @ano_user = FactoryGirl.create(:user, name: "Billy Bunter", email: "billy@billy.com")
  puts @ano_user.id
end

And /^(?:|there )should be a field (.+)$/ do |button_name|
  find_field (button_name)
end

And /^I am visiting the user_edit page$/ do 
  visit edit_user_path(@new_user)
end

And /^I am visiting the user_index page$/ do 
  visit users_path(@new_user)
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


And /^(?:|I )should see a link for each user$/ do  ||
  User.all().each do |user|   #{ |a| a[:href] }
    find_link (user.name)
  end
end

And /^I am signed in$/ do 
  sign_in @new_user
end

And /^I do not have admin rights$/ do 
 @new_user.valid?.should == true
 @new_user.admin?.should == false
end
 
Then /^make me an admin$/ do 
 @new_user.toggle!(:admin)
end
 
And /^I do have admin rights$/ do 
 @new_user.admin?.should == true
end


Then /^I am deleting (.+)$/ do |page_name|
  visit show_path_to(page_name)
end
