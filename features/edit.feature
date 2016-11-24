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
    # And I change description "modified" for "three"
    # Then I should see "modified"