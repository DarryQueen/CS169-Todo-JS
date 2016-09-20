Feature: View complete and incomplete tasks.

  As a user
  So that I can track my tasks
  I want to see both completed and incomplete tasks

Background:
  Given the following tasks:
    | description              | completed |
    | Write section materials. | true      |
    | Cure cancer.             | false     |

Scenario: Toggle off task.
  Given I am on the home page
  When I click the checkmark next to "Write section materials."
  Then I should be on the home page
  And I should see a checkbox next to "Write section materials."

Scenario: Toggle on task.
  Given I am on the home page
  When I click the checkmark next to "Cure cancer."
  Then I should be on the home page
  And I should see a checkbox next to "Cure cancer."

Scenario: Toggle on and off task.
  Given I am on the home page
  When I click the checkmark next to "Cure cancer."
  Then I should be on the home page
  And I should see a checkbox next to "Cure cancer."
  When I click the checkbox next to "Cure cancer."
  Then I should see a checkmark next to "Cure cancer."
