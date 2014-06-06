Feature: staring blankly at the worlds most boring welcome page

  Scenario: A User should be able to see almost bugger all on the home page
    Given I am on the static_pages home page
    Then I should be see "Sample App This is the home page for the"
    
    
  Scenario: A User should be able to see almost bugger all on the About page
    Given I am on the static_pages about page
    Then I should be see "About Us The Ruby"

