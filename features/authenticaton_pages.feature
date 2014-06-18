Feature: authentication pages

  Scenario: Visiting the Sign in page & sign up with no email or pwd
    Given I am on the signin page
    Then I should see a title "Ruby on Rails Tutorial Sample App | Sign in"
    And I should see "Sign in"
    And I should see the signin fields
    And I click on the button Sign in
    And I should see a title "Ruby on Rails Tutorial Sample App | Sign in"
    And I should see an alert error message "Invalid email/password combination"
    And I am on the signup page
    And I should no longer see the error message
 
  Scenario: Visiting the Sign in page & sign up with Ok email BUT invalid pwd
    Given I am an existing user
    Given I am on the signin page
    Then I should see a title "Ruby on Rails Tutorial Sample App | Sign in"
    And I should see "Sign in"
    And I should see the signin fields
    And I fill in correct email but invalid pwd signin fields
    And I click on the button Sign in
    And I should see a title "Ruby on Rails Tutorial Sample App | Sign in"
    And I should see an alert error message "Invalid email/password combination"
  
  
  Scenario: Visiting the Sign in page & sign up with Ok email BUT UPPERCASE pwd
    Given I am an existing user
    Given I am on the signin page
    Then I should see a title "Ruby on Rails Tutorial Sample App | Sign in"
    And I should see "Sign in"
    And I should see the signin fields
    And I fill in correct email but uppercase pwd signin fields
    And I click on the button Sign in
    And I should see a title "Ruby on Rails Tutorial Sample App | Sign in"
    And I should see an alert error message "Invalid email/password combination"
  
  
  
 
  Scenario: Visiting the Sign in page & sign up with invalid email BUT OK pwd
    Given I am an existing user
    Given I am on the signin page
    Then I should see a title "Ruby on Rails Tutorial Sample App | Sign in"
    And I should see "Sign in"
    And I should see the signin fields
    And I fill in invalid email but ok pwd signin fields
    And I click on the button Sign in
    And I should see a title "Ruby on Rails Tutorial Sample App | Sign in"
    And I should see an alert error message "Invalid email/password combination"
       
    
  Scenario: Visiting the Sign in page & sign up valid email & pwd
    Given I am an existing user
    Given I am on the signin page
    Then I should see a title "Ruby on Rails Tutorial Sample App | Sign in"
    And I should see "Sign in"
    And I should see the signin fields
    And I fill in correctly all the signin fields
    And I click on the button Sign in
    
      Then I should see a title "Ruby on Rails Tutorial Sample App"
      And I should see "foo Hartl"
      And I should see "Micropost Feed"
    
       
  Scenario: Visiting the Sign in page & sign up valid UPPERCASE email & correct pwd, & then logs out
    Given I am an existing user
    Given I am on the signin page
    Then I should see a title "Ruby on Rails Tutorial Sample App | Sign in"
    And I should see "Sign in"
    And I should see the signin fields
    And I fill in correctly signin but email is in capitals fields
    And I click on the button Sign in
    
      Then I should see a title "Ruby on Rails Tutorial Sample App"
      And I should see "foo Hartl"
      And I should see "Micropost Feed"
    
    Then I am showing the user_profile page
    
    And I should see a title "Ruby on Rails Tutorial Sample App | foo Hartl"
    And I should see "foo@example.com"
    And there should be authenticated links
    And I click on link Sign out
    Then I should see "Sample App This is the home page for the"
    And I should see a title "Ruby on Rails Tutorial Sample App"
    And there should be a link Sign in
   
   
  Scenario: Visiting the User edit page without signing in should send me to the sign in page
    Given I am an existing user
    And I am visiting the user_edit page
    Then I should see a title "Ruby on Rails Tutorial Sample App | Sign in"
    And I should see "Sign in"
    And I should see a notice message "Please sign in."
    And I should not see the link "Sign out"
    And I should not see the link "Profile"
    And I should not see the link "Settings"
    
    
   
  Scenario: Visiting the User index page without signing in should send me to the sign in page
    Given I am an existing user
    And I am visiting the user_index page
    Then I should see a title "Ruby on Rails Tutorial Sample App | Sign in"
    And I should see "Sign in"
    And I should see a notice message "Please sign in."
    
  Scenario: a non admin user can not delete a user  
    Given I am an existing user
    And create another user
     #Then I am deleting anouser from index page
     #  And I should see "Sample App This is the home page for the"
     #  And I should see a title "Ruby on Rails Tutorial Sample App"
     #  And I should see an alert error message "You do not have permission to delete a user"