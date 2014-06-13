Feature: user pages


  Scenario: A new user wants to sign up with no parameters & fails
    Given I am on the signup page 
    Then I should see a title "Ruby on Rails Tutorial Sample App | Sign up"
    And I should see the user fields
    And I click on the button Create my account
    And I should see a title "Ruby on Rails Tutorial Sample App | Sign up"
    And I should see "The form contains 6 errors"
    And I should see "Name can't be blank"
    And I should see "Name is too short (minimum is 5 characters)"
    And I should see "Email can't be blank"
    And I should see "Email is invalid"
    And I should see "Password is too short (minimum is 6 characters)"
    And I should see "Password can't be blank"
    And I should see the user fields
    And I should not see "Signup Successful. Welcome to the Sample App"
    
  Scenario: A new user wants to sign up with NO NAME parameter & fails
    Given I am on the signup page 
    Then I should see a title "Ruby on Rails Tutorial Sample App | Sign up"
    And I should see the user fields
    And I fill in all user fields except name
    And I click on the button Create my account
    And I should see a title "Ruby on Rails Tutorial Sample App | Sign up"
    And I should see "The form contains 2 errors"
    And I should see "Name can't be blank"
    And I should see "Name is too short (minimum is 5 characters)"
    And I should see the user fields
    And the Email field should have "foo.bar@foobar.com"
    And the Name field should have ""
    And I should not see "Signup Successful. Welcome to the Sample App"
    
    
    
  Scenario: A new user wants to sign up with valid parameter & works OK
    Given I am on the signup page 
    Then I should see a title "Ruby on Rails Tutorial Sample App | Sign up"
    And I should see the user fields
    And I fill in all the user fields
    And I click on the button Create my account
    Then I should see an alert success message "Signup Successful. Welcome to the Sample App"
    And I should see a title "Ruby on Rails Tutorial Sample App | Sign in"
    And I should see "Sign in"
    
  
  Scenario: Visiting an existing user profile page, but not signed in, is sent to the Sign in page, & after signing in, goes to desired page
    Given I am an existing user 
    Given I am showing the user_profile page 
    Then I should see a title "Ruby on Rails Tutorial Sample App | Sign in"
    And I should see "Sign in"
    And I should see a notice message "Please sign in."
    
    And I fill in correctly all the signin fields
    And I click on the button Sign in
    
    And I should see a title "Ruby on Rails Tutorial Sample App | foo Hartl"
    Then I should see "foo Hartl, foo@example.com"
    
    
  Scenario: An existing user can edit his page & change all his values
    Given I am an existing user 
    And I am signed in
    And I am visiting the user_edit page
    And I should see a title "Edit user"
    And there should be a link change
    And I should see the user edit fields
    And there should be a button Save changes
    And the "Name" field should contain "foo Hartl"
    And the "Email" field should contain "foo@example.com"
    And the "Password" field should be empty
    And the "Confirm Password" field should be empty
    And I fill in all the user edit fields with new values
    And I click on the button Save changes
    And I should see a title "Edit user"
    And I should see an alert success message "User settings changed."
    And the "Name" field should contain "Foo Bar new"
    And the "Email" field should contain "foo.bar@foobarnew.com"
    And the "Password" field should be empty
    And the "Confirm Password" field should be empty

  Scenario: An existing user when signed in can see his profile page
    Given I am an existing user 
    And I am signed in
    Given I am showing the user_profile page 
    Then I should see "foo Hartl, foo@example.com"
    And I should see a title "foo Hartl"
    
   Scenario: An existing user when signed in can see someone elses profile page
    Given I am an existing user 
    And create another user
    And I am signed in
    Given I am showing the ano user_profile page 
    Then I should see "Billy Bunter, billy@billy.com"
    And I should see a title "Billy Bunter"
   
   Scenario: An existing user when signed in can not edit someone elses profile page
    Given I am an existing user 
    And create another user
    And I am signed in
    And I am showing the ano user_edit page
    And I should see "Sample App This is the home page for the"
    And I should see a title "Ruby on Rails Tutorial Sample App"
    And I should see an alert error message "You do not have permission to edit the settings for someone else"
   
  Scenario: An existing user when signed in can see his edit page
    Given I am an existing user 
    And I am signed in
    And I am visiting the user_edit page
    And I should see a title "Edit user"
    And there should be a link change
    And I should see the user edit fields
    And there should be a button Save changes
    And the "Name" field should contain "foo Hartl"
    And the "Email" field should contain "foo@example.com"
    And the "Password" field should be empty
    
    
   Scenario: An existing signed in user sees all users on the index page
    Given I am an existing user 
    And create another user
    And I am signed in
    And I am visiting the user_index page
    And I should see a title "Ruby on Rails Tutorial Sample App | All users"