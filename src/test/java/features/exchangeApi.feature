@all
Feature: exchange rates api tests
  
  
  
  
  Scenario: basic test with status code
    Given url "http://api.exchangeratesapi.io/v1/latest?access_key=29abf879f3cdad157136b20a7cbaa1b2"
    When method GET
    Then status 200
  
  

  Scenario: get rates for a specific day
    Given url "http://api.exchangeratesapi.io/v1/2010-01-12?access_key=29abf879f3cdad157136b20a7cbaa1b2"
    When method GET
    Then status 200



  Scenario: match headers
    Given url "http://api.exchangeratesapi.io/v1/2010-01-12?access_key=29abf879f3cdad157136b20a7cbaa1b2"
    When method GET
    Then status 200
    And match header Content-Type == 'application/json; Charset=UTF-8'
    And match header Connection == 'close'
    And match header Date == "#present"


  Scenario: json body verification
    Given url "http://api.exchangeratesapi.io/v1/2010-01-12?access_key=29abf879f3cdad157136b20a7cbaa1b2"
    When method GET
    Then status 200
    And match header Content-Type == 'application/json; Charset=UTF-8'
    And print response
    And print response.base
    And match response.base == 'EUR'
    And match response.rates.USD == "#present"
    And print response.rates.USD
    And match response.rates.USD == 1.449908
