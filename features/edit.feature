Feature: user can edit task descriptions
  As an user,
  I should be able to edit the description of a task
  
 Background: tasks added to the database
   Given the following tasks:
   | description  | completed  |
   | one          | true       |
   | two          | false      |
   | three        | false      |

  Scenario: edit task three description
    Given I am on the tasks home page
    When I click the edit button next to "three"
    And I add text "modified"
    Then I should see "modified" within "three"