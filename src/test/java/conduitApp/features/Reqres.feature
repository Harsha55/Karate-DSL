
Feature: 'Testing reqres api'

Background: Give URL
    Given url apiUrl

    Scenario: 'Get list of users'
        Given path 'users'
        Given params {page : 1}
        When method Get
        Then status 200
        And match response.page == 1
        And match each response.data ==
        """
            
                {
                    "id": "#number",
                    "email": "#string",
                    "first_name": "#string",
                    "last_name": "#string",
                    "avatar": "#string"
                }
                
            
        """
    

    Scenario Outline: "validate error messages"
        Given path 'register'
        And request 
        """
            {
                "email": "<email>",
                "password": "<password>"
            }
        """
        When method Post
        Then status 400
        And match response == <errorMessage>

        Examples:
            | email              | password | errorMessage                                              |
            | eve.holt@reqres.in |          | {"error":"Missing password"}                              |
            |                    | pistol   | {"error":"Missing email or username"}                     |
            | eve.holt           | pistol   | {"error":"Note: Only defined users succeed registration"} |
         