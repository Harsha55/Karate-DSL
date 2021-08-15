
Feature: New user sign up

    Background: preconditions
        Given url apiUrl

    Scenario: New user
        Given def userDetails = {"email":"prisma6@art.com","username":"prisma6"}
        Given path 'users'
        And request 
        """
            {
                "user": {
                    "email": #(userDetails.email),
                    "password": "prismacolor",
                    "username": #(userDetails.username)
                }
            }
        """
        When method Post
        Then status 200
