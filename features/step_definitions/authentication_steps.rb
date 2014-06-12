And /^(?:|I )should see the signin fields$/ do 
  steps %{
  And there should be a field Email
  And there should be a field Password
  And there should be a button Sign in
  And there should be a link Sign up now!
  }
end

And /^(?:|I )fill in correctly all the signin fields$/ do
  fill_in 'Email', :with => 'foo@example.com'
  fill_in 'Password', :with => 'foobar123'
end