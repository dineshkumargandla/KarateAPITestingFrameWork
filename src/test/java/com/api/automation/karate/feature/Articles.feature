Feature:
  Background:
    * url 'https://api.realworld.io/api'
    * def tokenResponse = call read('classpath:com/api/automation/karate/helpers/CreateToken.feature')
    * def token = tokenResponse.authToken

      Scenario: Post an Article to application
        * def tokenResponse = call read('classpath:com/api/automation/karate/helpers/CreateToken.feature')
        * def token = tokenResponse.authToken


#          Given header Authorization = 'Token ' +token
#          Given path 'articles'
#          And request {"article": {"title": "Dinezh Karate12ssd3", "description": "a1","body": "Av12d"}}
#          When method Post
#          Then status 200
#          And match response.article.title == 'Dinezh Karate12ssd3'

        Scenario:Delete an Article
          * def tokenResponse = call read('classpath:com/api/automation/karate/helpers/CreateToken.feature')
          * def token = tokenResponse.authToken

          Given path 'articles'
          Given header Authorization = 'Token ' +token
          And request {"article": {"title": "t4545esetgfdfgdfgsdsdf", "description": "a1","body": "Av12d"}}
          When method Post
          Then status 200
          * def articleId = response.article.slug

          Given header Authorization = 'Token ' +token
          Given path 'articles',articleId
          When method Delete
          Then status 204

