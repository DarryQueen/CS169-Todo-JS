Feature: user can delete tasks
  As an user,
  I should be able to delete existing tasks
  
 Background: tasks added to the database
   Given the following tasks:
   | description  | completed  |
   | one          | true       |
   | two          | false      |
   | three        | false      |

  Scenario: delete task one
    Given I am on the tasks home page
    When I click the delete button next to "three"
    Then I should not see task "three"
    But I should see "one"
    And I should see "two"