Feature: staring blankly at the worlds most boring welcome page


  Scenario: A User should be able to see almost bugger all
    Given I am on the static_pages help page
    Then I should be see "Help Get help on the Ruby on Rails Tutorial"


  Scenario: A User should be able to see almost bugger all on the home page
    Given I am on the static_pages home page
    Then I should be see "Sample App This is the home page for the"
    
    
  Scenario: A User should be able to see almost bugger all on the About page
    Given I am on the static_pages about page
    Then I should be see "About Us The Ruby"

    
  Scenario: A User should be able to see Contact page
    Given I am on the static_pages contact page
    Then I should be see "Contact Contact Ruby on Rails Tutorial about the sample app at the"

