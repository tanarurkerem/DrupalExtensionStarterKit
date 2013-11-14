@api
Feature: Authenticated user can't add new content

  Scenario: Try adding page
    Given I am logged in as a user with the "authenticated user" role
    When I am on "node/add/page"
    Then the response status code should be 403
