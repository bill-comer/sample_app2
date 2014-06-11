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
    Then I should see "foo.bar@foobar.com"
    And I should see a title "Ruby on Rails Tutorial Sample App | Foo Bar"
 

  Scenario: An existing user profile page
    Given I am an existing user 
    Given I am showing the user_profile page 
    Then I should see "foo Hartl, foo@example.com"
    And I should see a title "foo Hartl"

   