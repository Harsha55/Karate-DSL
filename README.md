# Karate-DSL
Karate framework

Open source
BDD framework (automationstepbystep.com)
Written in java
Json support
Cons
Its own scripting language ( so does not support intelligence)
Difficult to debug



Features
Parallel and distributes testing
Cross browser and cross platform testing
Prerequisite 
	- Java installed (java 8 at least)
	- karate works on openjdk
IDE
	- Eclipse, IntelliJ, VS
Dependency Management
	- Maven, Gradle
Project Setup - create a maven project
    - add dependency in pom.xml
	- karate core
	- karate JUnit4
	- karate Apache
	
    - Api setup
	- First create a BDD feature file name.feature in src/test/java
. It will have sample data. Or write a scenario        	in it.
 	- reqres.in for sample api
	- Given When Then is the statements used to write a scenario.	
	- create a tests runner java file in src/test/java.(useful when we want to run it with a specific requirement) 
		- add a @RunWith() before the class in test runner file
	
GET Api request
Create a feature file in src/test/java. Ex: get.feature

Scenario: write some description
Given url ‘some api endpoint’
When method GET
Then status 200
And print response
Background:  (Any common part that every scenario needs can be put in it)
Url ‘some url’
Header Accept =‘application/json’
Chrome plugin : pathfinder
POST request :create any new data on a server
Feature file in src/test/java. Ex: post.feature
Create feature and scenario.


We can print response also.

An item can be dynamic so, karate provides a way to bypass this in match. 
#ignore, #string can be put instead of data
Add def expectedOutput = read(‘some json file location’). 
A variable to store the data and can be used to match instead of data in the scenario.	
We can also take a relative path to request the body from file.
PUT method
We need to provide body (data, payload)
Feature file then add feature and scenario.
DELETE Method

There will be no request step.
AND keyword 
The AND keyword can be used to do assertions on data. 
And match response.tags == ‘#array’.  This is to match the response is an array.       
And match each response.tags == ‘#string’.

We can also match length of array.
And match response.articles == ‘#[10]’





Running Karate 
@Karate.Test
    Karate testTags(){
        return Karate.run().tags("@debug").relativeTo(getClass());
    }

If we use the above code in runner file. The where ever we use @debug tag we can run that test with the following command:- mvn test -Dtest=runnerFileName#methodName. 
mvn test -Dtest=ConduitTest#testTags	
**Another way is karate options
karate options is another way.


var accessToken = karate.callSingle('classpath:helpers/CreateToken.feature',config).authToken;
  karate.configure('headers',{Authorization : 'Token '+accessToken});


These are used to get the token so we don’t have to give it for every scenario. Call single, configure are some functions of karate.


The above is the example of embedded expression.
To create multi line expression, like json. User “”” json object “””.
Assertions
We can always assert whether the data type is an array, string boolean or number.
And match response.data[0].first_name contains 'George'
And match response..data == "#array"
And match each response..total == “#number"


‘#string’ is used to check if the value is string or not. But in case, the value is null then ‘##string’ can be used. 


Java data
Java faker is a library which can be used to have random email.
Data driven test can be written with “Scenario outline: “ at start.

Retry and sleep
Retry can be used to run a number of times with some condition.
* configure retry = {count: 10, interval: 5000}
        Given params {limit : 10, offset: 0}
        Given path 'articles'
        * retry until response.articles[0].favouritesCount == 1
