Feature: Tables API

Background:
    Given url baseUrl + '/api/admin/login'

    * def loginRequest =
    """
    {
      "username": "admin",
      "password": "admin123"
    }
    """

    And request loginRequest
    When method POST
    Then status 200
    * def token = response.token


Scenario: Get all tables
    Given url baseUrl + '/api/tables'

    * def tablesRequest = {}

    And header Authorization = 'Bearer ' + token
    And request tablesRequest
    When method GET
    Then status 200

    # Attach request and response to report
    * karate.embed(tablesRequest, 'application/json')
    * karate.embed(response, 'application/json')