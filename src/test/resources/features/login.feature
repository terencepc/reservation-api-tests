Feature: Login API

Scenario: Successful login with valid credentials
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
    And match response contains { token: '#string' }

    # Attach request and response
    * karate.embed(loginRequest, 'application/json')
    * karate.embed(response, 'application/json')


Scenario: Login with invalid password
    Given url baseUrl + '/api/admin/login'

    * def loginRequest =
    """
    {
      "username": "admin",
      "password": "wrongpass"
    }
    """

    And request loginRequest
    When method POST
    Then status 401
    And match response.message == 'Invalid credentials'

    # Attach request and response
    * karate.embed(loginRequest, 'application/json')
    * karate.embed(response, 'application/json')