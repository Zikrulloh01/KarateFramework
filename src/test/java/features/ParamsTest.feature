@all
Feature: Parameter Passing



  Background:
    * def baseUrl = "http://api.exchangeratesapi.io/v1/?access_key=29abf879f3cdad157136b20a7cbaa1b2"
    * def spartanUrl = "http://100.26.102.120:8000"
    * def hr_url = "http://100.26.102.120:1000/ords/hr"


  Scenario: path parameters
    Given url baseUrl
    # path is the statement that comes right after the base url like {id}, {name}
    And path "latest"
    When method GET
    Then status 200



  Scenario: path parameters
    Given url baseUrl
    And path "2010-01-12"
    When method GET
    Then status 200



  Scenario: Spartans Connection
    Given url spartanUrl
    # path to get all spartans
    And path "/api/spartans"
    When method GET
    Then status 200

  Scenario: Spartans Connection
    Given url spartanUrl
    # path for all spartans
    And path "/api/spartans"
    # path for passing a specific id to get only 1 spartan
    And path "7"
    When method GET
    Then status 200



    Scenario: Assert Spartan
      Given url spartanUrl
      # creating a spartan in json format
      * def expectedSp =
      """
        {
          "id": 7,
          "name": "OSCAR",
          "gender": "Male",
          "phone": 5278678322
         }
      """
      And path "/api/spartans"
      And path "7"
      When method GET
      Then status 200
      And print response
      # Assertion happens with "match" keyword
      Then match response == expectedSp



  Scenario: Assert Spartan
    Given url spartanUrl
    And path "/api/spartans/search"
    # the type of parameter we pass should be provided in api documentation.Scenario.Scenario:
    # In this case "nameContains" parameter is developed in api
    And param nameContains = 'j'
    # In this case "gender" parameter is developed in api
    And param gender = "Female"
    When method GET
    Then status 200
    # print the response. In Karate Framework response in jsn format is saved in to response variable like as in java
    And print response
    # Assertion of headers content type
    # we use header keyword and state the header provided in api
    And match header Content-Type == "application/json"
    # In this case the api returns multiple spartans in order to verify each of them in assertion
    # we use "match each" keywords as it loops through each response
    And match each response.content contains {"gender":"Female"}
    # in order to reach a specific response like name gender we use .(dot) notation as we do in restAssured
    And match each response.content[*].gender == "Female"
    # Asserting the data type #number, #string, #boolean
    And match each response.content[*].phone == "#number"




    Scenario: Hr regions
      Given url hr_url
      And path "regions"
      When method GET
      Then status 200
      And print response
