Feature: Testing the Users and Authentication

  Background:
      * url 'https://api.realworld.io/api'
      Given path 'users/login'
      * def constants = Java.type('com.api.automation.karate.helpers.Constants')
      * def getExistingEmail = constants.getExistingEmail();
      * def getExistingPassword = constants.getExistingPassword();
      * def getExistingUserName = constants.getExistingUserName();

  Scenario Outline: <ScenarioDescription>
      And request
                    """
                    {
                    "user": {
                      "email": "<Email>",
                      "password": "<Password>"
                    }
                  }
                    """
      When method Post
      And response.user.username == "<Response>"

      #And match response.user.username contains  '<Response>' || response == <Response>
    Examples:
      | ScenarioDescription                                      | Email               | Password               | Response                  |
      | Testing with Valid Email and password                    | #(getExistingEmail) | #(getExistingPassword) |  #(getExistingUserName) |


  Scenario Outline: <ScenarioDescription>
    And request
                    """
                    {
                    "user": {
                      "email": "<Email>",
                      "password": "<Password>"
                    }
                  }
                    """
    When method Post
    And response== <Response>

    Examples:
      | ScenarioDescription                      | Email               | Password               | Response                                        |
      | Passing Empty Email Id                   |                     | #(getExistingPassword) | {"errors":{"email":["can't be blank"]}}         |
      | Passing Empty Password                   | #(getExistingEmail) |                        | {"errors":{"password":["can't be blank"]}}      |
      | Passing Invalid Email and Password       | dinezh@test.com     | incorrectPassword      | {"errors":{"email or password":["is invalid"]}} |
      | Passing valid Email and invalid Password | #(getExistingEmail) | incorrectPassword      | {"errors":{"email or password":["is invalid"]}} |
      | Passing Empty Email and  Password        |                     |                        | {"errors":{"email":["can't be blank"]}}         |





