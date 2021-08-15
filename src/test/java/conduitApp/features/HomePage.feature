@debug
Feature: Run test for home page

Background: Give URL
    Given url apiUrl
     
    Scenario: Get all tags
        * def sleep = function(pause){ java.lang.Thread.sleep(pause) }
        Given path 'tags'
        When method Get
        * eval sleep(5000)
        Then status 200
        #And match response.tags contains ['Cartoon' , 'public']

    Scenario: Get 10 articles
        * configure retry = {count: 10, interval: 5000}
        Given params {limit : 10, offset: 0}
        Given path 'articles'
        * retry until response.articles[0].favouritesCount == 1
        When method Get
        Then status 200


    


