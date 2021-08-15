
Feature: Run test for adding article

    Background: Define URL
        Given url apiUrl 
        
        

    Scenario: Create a new article
       
        Given path 'articles'
        And request {"article":{"tagList": [],"title": "BTS","description": "dynamite","body": "this is best"}}
        When method Post
        Then status 200
        And match response.article.title == 'dynamite'


    Scenario: Create and Delete article
        
        Given path 'articles'
        And request {"article":{"tagList": [],"title": "Kpop","description": "dynamite","body": "this is best"}}
        When method Post
        Then status 200
        * def articleId = response.article.slug

        Given params { limit: 10, offset:0}
        Given path 'articles'
        When method Get
        Then status 200
        And match response.articles[0].title == 'Kpop'

        
        Given path 'articles',articleId
        When method Delete
        Then status 200

        Given params {limit:10, offset:0}
        Given path 'articles'
        When method Get
        Then status 200
        And match response.articles[0].title != 'Kpop'


