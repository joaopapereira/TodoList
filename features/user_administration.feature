Feature: User Administration
    Background:
        Given the following user exists:
      | email           | password | username |
      | user1@email.com | SECRET1  | user1    |
      | user2@email.com | SECRET2  | user2    |
      
    Scenario: Add a new user
        Given I am not logged in
        Then I go to user registration page
        And I fill registration form with name "testuser" email "testuser@email.com" and password "mysecret"
        And I should see "created correctly" within "#gritter-notice-wrapper"
        
    Scenario: Edit an existing user
        Given I am logged in as "user1@email.com" and password "SECRET1"
        Then I go to user "user1" edit page
        And I change the password to "SECRET3"
        And I see the message of successfull user edit
        And I logout
        And I am logged in as "user1@email.com" and password "SECRET3"
     
