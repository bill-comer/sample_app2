Feature: user pages


  Scenario: A new user wants to sign up with no parameters
    Given I am on the signup page 
    Then I should see a title "Ruby on Rails Tutorial Sample App"
    And there should be a button Create my account
    And there should be a field Name
    And there should be a field Email
    And there should be a field Password
    And there should be a field Confirmation
    And I click on the button Create my account

  Scenario: An existing user profile page
    Given I am an existing user 
    Given I am showing the user_profile page 
    Then I should see "foo@example.com"
    And I should see a title "foo Hartl"

   