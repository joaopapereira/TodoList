Feature: Manage ToDo's
    Background:
        Given the following user exists:
      | email           | password |
      | user1@email.com | SECRET1  |
      | user2@email.com | SECRET2  |
        Given the following ToDo exists:
      | user            | text       | enddate    |
      | user1@email.com | ToDo1      | 26/02/2013 |
      | user2@email.com | ToDo2      | 1/1/2050   |
      | user1@email.com | ToDo3      | 22/04/2000 |
    
    Scenario: Add new ToDo
        Given I am logged with email 'user1@email.com' and password 'SECRET1'
        And   I am at the add todo page
        Then  I fill the form with text 'New ToDo' and date '22/10/2040 10:05'
        And   I see the message of successfull ToDo Added
        And   I go to the home page
        And   I see 'New ToDo' is present
    Scenario: Edit new ToDo
        Given I am logged with email 'user1@email.com' and password 'SECRET1'
        And   I am at 
        Then  I fill the form with text 'New ToDo' and date '22/10/2040 10:05'
        And   I see the message of successfull ToDo Added
        And   I go to the home page
        And   I see 'New ToDo' is present    
