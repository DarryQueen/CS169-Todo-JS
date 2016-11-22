Feature: user can check tasks as complete
  As an user,
  I should be able check a task as complete
  
  Background: tasks added to the database
    Given the following tasks:
    | description  | completed  |
    | one          | true       |
    | two          | false      |
    | three        | false      |
    
  Scenario: mark task two as complete  
    Given I am on the tasks home page
    When I click the check true next to "two"
    Then I should see a check true next to "two"
    
  Scenario: mark task two as incomplete  
    Given I am on the tasks home page
    When I click the check false next to "two"
    Then I should see a check false next to "two"  