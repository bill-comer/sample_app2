Feature: user pagess


  Scenario: A new user wants to sign up
    Given I am on the signup page 
    And I should see a title "Ruby on Rails Tutorial Sample App"
    Then I should see "Sign up"
