@api @javascript
Feature: Provide menu link Checkobx works

  Scenario: When check "Provide a menu link" the "Menu link title" appear
    Given I am logged in as a user with the "administrator" role
    When I follow "Add new content"
    And I follow "Basic page"
    And I check the box "Provide a menu link"
    Then I should see the text "Menu link title"
