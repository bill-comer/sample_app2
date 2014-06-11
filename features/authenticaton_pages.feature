Feature: authentication pages

  Scenario: Visiting the Sign in page & sign up with no email or pwd
    Given I am on the signin page
    Then I should see a title "Ruby on Rails Tutorial Sample App | Sign in"
    And I should see "Sign in"
    And I should see the signin fields
    And I click on the button Sign in
    And I should see a title "Ruby on Rails Tutorial Sample App | Sign in"
    And I should see an alert error message "Invalid email/password combination"
    
    