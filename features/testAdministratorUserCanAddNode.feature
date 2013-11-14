@api
Feature: Administrator user can add new content

  Scenario: Add page and see title
    Given I am logged in as a user with the "administrator" role
    When I follow "Add new content"
    And I follow "Basic page"
    And I enter "Test" for "Title"
    And I press "Save"
    Then I should see the text "Test"

  Scenario: Add page and see title
    Given I am logged in as a user with the "administrator" role
    When I follow "Add new content"
    And I follow "Basic page"
    And I enter "Test" for "Title"
    And I press "Save"
    And I am on "admin/content"
    Then I should see the text "Test"
