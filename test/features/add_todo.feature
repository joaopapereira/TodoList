Feature: Add a new Todo to the list
    Background:
        Given the following user exists:
      | email           | password |
      | user1@email.com | SECRET1  |
      | user2@email.com | SECRET2  |
      
    Scenario: Cannot add ToDo if not logged
        Given I am not logged
        Then I get no logged error
    Scenario: Add ToDo without date
        Given I am logged with user1
        When I try to add ToDo without date
        Then I get date needed error
    Scenario: Add ToDo
        Given I am logged with user1
        When I try to add ToDo "New work"
        Then I see "New work" in the page