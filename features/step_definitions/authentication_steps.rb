And /^(?:|I )should see the signin fields$/ do 
  steps %{
  And there should be a field Email
  And there should be a field Password
  And there should be a button "Sign in"
  And there should be a link "Sign up now!"
  }
end

And /^(?:|I )fill in correct email but invalid pwd signin fields$/ do
  fill_in 'Email', :with => 'foo@example.com'
  fill_in 'Password', :with => 'foobar124'
end

And /^(?:|I )fill in correct email but uppercase pwd signin fields$/ do
  fill_in 'Email', :with => 'foo@example.com'
  fill_in 'Password', :with => 'fOObar124'
end

And /^(?:|I )fill in invalid email but ok pwd signin fields$/ do
  fill_in 'Email', :with => 'fo0@example.com'
  fill_in 'Password', :with => 'foobar123'
end

And /^(?:|I )fill in correctly all the signin fields$/ do
  fill_in 'Email', :with => 'foo@example.com'
  fill_in 'Password', :with => 'foobar123'
end

And /^(?:|I )fill in correctly signin but email is in capitals fields$/ do
  fill_in 'Email', :with => 'FOO@EXAMPLE.COM'
  fill_in 'Password', :with => 'foobar123'
end

And /^there should be authenticated links$/ do  ||
  steps %{
    And there should be a link "Profile"
    And there should be a link "Users"
    And there should be a link "Settings"
    And there should be a link "Sign out"
  }
end