Feature: User Administration
    Background:
        Given the following user exists:
      | email           | password |
      | user1@email.com | SECRET1  |
      | user2@email.com | SECRET2  |
      
    Scenario: Add a new user
        Given I am not logged in
        Then I go to user registration page
        And I fill registration form with email 'testuser@email.com' and password 'mysecret'
        And I see the message of successfull user registration
        
    Scenario: Edit an existing user
        Given I am logged with email 'user1@email.com' and password 'SECRET1'
        Then I go to user edit page
        And I change the password to 'SECRET3'
        And I see the message of successfull user edit
        And I logout
        And I go to user login page
        And I logged in with email 'user1@email.com' and password 'SECRET3'
     
