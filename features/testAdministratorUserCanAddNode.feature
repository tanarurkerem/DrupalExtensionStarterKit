@api
Feature: Administrator user can add new content

  Background:
    Given I am logged in as a user with the "administrator" role
    When I follow "Add new content"
    And I follow "Basic page"
    And I enter "Test" for "Title"
    And I press "Save"

  Scenario: Add page and see title
    Then I should see the text "Test"

  Scenario: Add page and see title
    And I am on "admin/content"
    Then I should see the text "Test"
