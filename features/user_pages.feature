Feature: user pages


  Scenario: A new user wants to sign up
    Given I am on the signup page 
    Then I should see "Sign up"
    And I should see a title "Ruby on Rails Tutorial Sample App"

  Scenario: An existing user profile page
    Given I am an existing user 
    Given I am showing the user_profile page 
    Then I should see "foo@example.com"
    And I should see a title "foo Hartl"

   