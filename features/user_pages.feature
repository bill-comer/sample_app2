Feature: user pages


  Scenario: A new user wants to sign up with no parameters & fails
    Given I am on the signup page 
    Then I should see a title "Ruby on Rails Tutorial Sample App | Sign up"
    And I should see the user fields
    And I click on the button "Create my account"
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
    And I click on the button "Create my account"
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
    And I click on the button "Create my account"
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
    And I click on the button "Sign in"
    
    And I should see a title "Ruby on Rails Tutorial Sample App"
    And I should see "foo Hartl"
    And I should see "Micropost Feed"
    And I should see "0 followers"
    And I should see "0 following"
    
    
  Scenario: An existing user can edit his page & change all his values
    Given I am an existing user 
    And I am signed in
    And I am visiting the user_edit page
    And I should see a title "Edit user"
    And there should be a link "change"
    And I should see the user edit fields
    And there should be a button "Save changes"
    And the "Name" field should contain "foo Hartl"
    And the "Email" field should contain "foo@example.com"
    And the "Password" field should be empty
    And the "Confirm Password" field should be empty
    And I fill in all the user edit fields with new values
    And I click on the button "Save changes"
    And I should see a title "Edit user"
    And I should see an alert success message "User settings changed."
    And the "Name" field should contain "Foo Bar new"
    And the "Email" field should contain "foo.bar@foobarnew.com"
    And the "Password" field should be empty
    And the "Confirm Password" field should be empty

  Scenario: An existing user when signed in can see his profile page, with two microposts
    Given I am an existing user 
      And I have a micropost "my first micropost"
      And I have a micropost "my second micropost"
      And I am signed in
    Given I am showing the user_profile page 
    Then I should see "foo Hartl, foo@example.com"
      And I should see a title "foo Hartl"
      And I should see "Microposts"
      And I can see my micropost "my first micropost"
      And I can see my micropost "my second micropost"
    
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
    Then I should see "foo Hartl"
    And there should be a link "view my profile"
    And I should see an alert error message "You do not have permission to edit the settings for someone else"
   
  Scenario: An existing user when signed in can see his edit page
    Given I am an existing user 
    And I am signed in
    And I am visiting the user_edit page
    And I should see a title "Edit user"
    And there should be a link "change"
    And I should see the user edit fields
    And there should be a button "Save changes"
    And the "Name" field should contain "foo Hartl"
    And the "Email" field should contain "foo@example.com"
    And the "Password" field should be empty
    
    
   Scenario: An existing signed in non admin user sees all users on the index page
    Given I am an existing user 
    And create another user
    And I am signed in
    And I am visiting the user_index page
    And I should see a title "Ruby on Rails Tutorial Sample App | All users"
    And I should see a link for each user
    And I should not see "delete"
    
   Scenario: Test a user can be made an admin user 
    Given I am an existing user 
      And I do not have admin rights
    Then make me an admin
      And I do have admin rights
    And I am visiting the user_index page
    #And there should be a link delete
    
    
  Scenario: A user with 1 follower, but no following
    Given I am an existing user 
    And create another user
    And I have 1 follower
    And I am showing the user_profile page 
    Then I should see a title "Ruby on Rails Tutorial Sample App | Sign in"
    And I should see "Sign in"
    And I should see a notice message "Please sign in."
    
    Then I fill in correctly all the signin fields
      And I click on the button "Sign in"
    
    Then I should see a title "Ruby on Rails Tutorial Sample App"
      And I should see "1 followers"
      And I should see "0 following"
       And there should be a link "1 followers"
       And there should be a link "0 following"
   
     Then click on link "1 followers"
      And I should see a title "Ruby on Rails Tutorial Sample App | Followers"
      
     Then click on link "0 following"
      And I should see a title "Ruby on Rails Tutorial Sample App | Following"
    