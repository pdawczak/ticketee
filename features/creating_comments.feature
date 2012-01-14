Feature: Creating comments
  In order to update a ticket's progress
  As a user
  I want to leave comments

  Background:
  Given there are the following users:
    | email             | password |
    | user@ticketee.com | password |
  And I am signed in as them
  And there is a project called "Ticketee proj"
  And "user@ticketee.com" can view the "Ticketee proj" project
  And "user@ticketee.com" has created a ticked for this project:
    | title                   | description                             |
    | Change a ticket's state | You should be able to create a comment  |
  Given I am on homepage
  And I follow "Ticketee proj"
  
  Scenario: Creating a comment
    # Then show me the page
    When I follow "Change a ticket's state"
    And I fill in "Text" with "Added a comment!"
    And I press "Create Comment"
    Then I should see "Comment has been created."
    Then I should see "Added a comment!" within "#comments"
  
  Scenario: Creating an invalid comment
    When I follow "Change a ticket's state"
    And I press "Create Comment"
    Then I should see "Comment has not been created."
    And I should see "Text can't be blank"
