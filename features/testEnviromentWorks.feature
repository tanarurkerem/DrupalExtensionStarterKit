Feature: Testing Test Enviroment Works

  Scenario: Access homepage
    When I go to homepage
    Then the response status code should be 200
