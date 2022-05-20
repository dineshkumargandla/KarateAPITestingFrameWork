Feature: Testing the Registration Page

  Background:
    * url 'https://api.realworld.io/api'
    Given path 'users'
    * def fakeDataGenerator = Java.type('com.api.automation.karate.helpers.DataGenerator')
    * def getUserName = fakeDataGenerator.getUserName();
    * def getRandomEmail = fakeDataGenerator.getRandomEmail();
    * def constants = Java.type('com.api.automation.karate.helpers.Constants')
    * def getExistingEmail = constants.getExistingEmail();
    * def getExistingPassword = constants.getExistingPassword();
    * def getExistingUserName = constants.getExistingUserName();

  Scenario Outline: <ScenarioDescription>
    And request
                    """
                   {
                    "user": {
                      "username": "<UserName>",
                      "email": "<Email>",
                      "password": "<Password>"
                    }
                  }
                    """
    When method Post
    And response.user.username == "<Response>"

    Examples:
      | ScenarioDescription                   | Email             | Password               | UserName       | Response               |
      | Testing with Valid Email and password | #(getRandomEmail) | #(getExistingPassword) | #(getUserName) | #(getExistingUserName) |

  Scenario Outline: <ScenarioDescription>
    And request
                    """
                   {
                    "user": {
                      "username": "<UserName>",
                      "email": "<Email>",
                      "password": "<Password>"
                    }
                  }
                    """
    When method Post
    And response== <Response>

    Examples:
      | ScenarioDescription                                        | Email               | Password               | UserName               | Response                                                                              |
      | Testing with already registered Email and password         | #(getExistingEmail) | #(getExistingPassword) | #(getExistingUserName) | {"errors":{"email":["has already been taken"],"username":["has already been taken"]}} |
      | Testing with new Email and already registered UserName     | #(getRandomEmail)   | #(getExistingPassword) | #(getExistingUserName) | {"errors":{"username":["has already been taken"]}}                                    |
      | Testing with already registered Email and new UserName     | #(getExistingEmail) | #(getExistingPassword) | #(getUserName)         | {"errors":{"email":["has already been taken"]}}                                       |
      | Testing with empty  Email and new UserName                 |                     | #(getExistingPassword) | #(getUserName)         | {"errors":{"email":["can't be blank"]}}                                               |
      | Testing with new Email and empty UserName                  | #(getRandomEmail)   | #(getExistingPassword) |                        | {"errors":{"username":["can't be blank"]}}                                            |
      | Testing with new Email and new UserName and empty password | #(getRandomEmail)   |                        | #(getUserName)         | {"errors":{"password":["can't be blank"]}}                                            |
      | Testing with all empty parameter                           |                     |                        |                        | {"errors":{"email":["can't be blank"]}}                                               |
