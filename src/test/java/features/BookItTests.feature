Feature: BookIt Api tests

  Background:
    * def baseUrl = "https://cybertek-reservation-api-qa3.herokuapp.com/"
    * def AuthFeature = call read("classpath:features/BookItAuth.feature")
    * def accessToken = AuthFeature.token
    * print "Token from Background ", accessToken




  Scenario: get user information
    Given url baseUrl
    And path "api/users/me"
    And header Authorization = "Bearer " + accessToken
    And header Accept = "application/json"
    When method GET
    Then status 200
    And print response
    And match response == {"id":140,"firstName":"Ase","lastName":"Norval","role":"student-team-leader"}
  
  
  
  
  
  
  @wip
  Scenario: get campus information
    Given url baseUrl
    And path "api/campuses"
    And header Authorization = "Bearer " + accessToken
    And param Accept = "application/json"
    When method GET
    Then status 200
    And print response
    And def expectedCampuses = read("classpath:data/campuses.json")
    And match response == expectedCampuses
