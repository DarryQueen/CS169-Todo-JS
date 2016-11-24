Feature: user can create tasks
  As an user,
  I should be able create a todo task
  
  Scenario: create a task
    Given I am on the tasks home page
    When I add description "Climb Kilimanjaro."
    Then I should see "Climb Kilimanjaro."