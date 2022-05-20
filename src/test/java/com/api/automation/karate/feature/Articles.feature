Feature:
  Background:
    * url 'https://api.realworld.io/api'
    * def tokenResponse = call read('classpath:com/api/automation/karate/helpers/CreateToken.feature')
    * def token = tokenResponse.authToken
    * def DataGenerator = Java.type('com.api.automation.karate.helpers.DataGenerator')



        Scenario:Delete an Article
          * def tokenResponse = call read('classpath:com/api/automation/karate/helpers/CreateToken.feature')
          * def token = tokenResponse.authToken
          * def randomTitle = DataGenerator.getTitle()
          * def randomDescription = DataGenerator.getDescription()
          * def randomBody = DataGenerator.getArticleBody()

          Given path 'articles'
          Given header Authorization = 'Token ' +token
          And request
          """
          {
          "article":
          {
          "title": #(randomTitle),
          "description": #(randomDescription),
          "body": #(randomBody)
          }
          }
          """
          When method Post
          Then status 200
          * def articleId = response.article.slug
          Given header Authorization = 'Token ' +token
          Given path 'articles',articleId
          When method Delete
          Then status 200

