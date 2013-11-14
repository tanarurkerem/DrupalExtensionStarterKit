@api @javascript
Feature: Module Groups Fieldset Works

  Scenario: Close Core Group
    Given I am logged in as a user with the "administrator" role
    And I am on "/admin/modules"
    When I click "Core"
    Then I should not see the text "Aggregator"
