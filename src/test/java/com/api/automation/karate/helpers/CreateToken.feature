Feature: Create Token
  Background: Define URL
    * url 'https://api.realworld.io/api'
    Scenario: Create Token
      Given path 'users/login'
      And request { "user": {"email": "dinesh@test.com","password": "dinesh123"}}
      When method Post
      Then status 200
       * def authToken = response.user.token