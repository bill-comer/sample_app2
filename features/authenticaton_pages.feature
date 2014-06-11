Feature: authentication pages

  Scenario: Visiting the Sign in page
    Given I am on the signin page
    Then I should see a title "Ruby on Rails Tutorial Sample App | Sign in"
    And I should see "Sign in"
    