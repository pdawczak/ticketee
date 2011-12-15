Feature: Deleting tickets
  In order to remove tickets
  As a user
  I want to press a button and make them disappear

  Background:
    Given there are the following users:
      | email             | password |
      | user@ticketee.com | password |
    And I am signed in as them
    And there is a project called "TextMate 2"
    And "user@ticketee.com" can view the "TextMate 2" project
    And "user@ticketee.com" has created a ticked for this project:
      | title                 | description                   |
      | Make it shiny!        | Gradients! Starburst! Oh my!  |
    Given I am on homepage
    When I follow "TextMate 2"
    And I follow "Make it shiny!"
  
  Scenario: Updating a ticket
    When I follow "Delete Ticket"
    Then I should see "Ticket has been deleted."
    And I should be on the project page for "TextMate 2"