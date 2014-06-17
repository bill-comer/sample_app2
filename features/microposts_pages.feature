Feature: microposts pages


  Scenario: Post fails if content is empty
    Given I am an existing user 
    And I am signed in
    And I am on the static_pages home page
      Then there should be a link view my profile
      And there should be a button Create Post
        Then I click on the button Create Post
          And I should see an alert error message "The form contains 1 error"
          And I should see "Content can't be blank"
         # And the number of microposts should not change
      
      
  Scenario: Post fails if content is too long
    Given I am an existing user 
    And I am signed in
    And I am on the static_pages home page
      Then there should be a link view my profile
      And there should be a button Create Post
      Then I fill in a too big post
        And I click on the button Create Post
        Then I should see "The form contains 1 error"
        Then I should see "Content is too long"
        And the number of microposts should be "0"
      
      
  Scenario: Post works for an OK message
    Given I am an existing user 
    And I am signed in
    And I am on the static_pages home page 
      Then there should be a link view my profile
      And there should be a button Create Post
        Then I fill in a post "hello, this is a test post"
        And I click on the button Create Post
        And the number of microposts should be "1"
        And I can see my micropost "hello, this is a test post"
        And I should see "Micropost Feed"
        And I should see "1 micropost"
        And there should be a link delete post
        And click on link delete post
          Then I should see "0 microposts"
