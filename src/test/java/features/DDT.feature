@all
Feature: Data Driven Tests






  Scenario Outline: get token for different users
    Given url "https://cybertek-reservation-api-qa3.herokuapp.com"
    And path "/sign"
    And header Accept = "application/json"
    And param email = "<email>"
    And param password = "<password>"
    When method GET
    Then status 200
    * def token = response.accessToken
    Given url "https://cybertek-reservation-api-qa3.herokuapp.com"
    And path "api/users/me"
    And header Authorization = "Bearer " + token
    And header Accept = "application/json"
    When method GET
    Then status 200
    And print response


    Examples:
      | email                       | password           |
      | sbirdbj@fc2.com             | asenorval          |
      | htwinbrowb4@blogspot.com    | kanyabang          |
      | dfrederickb5@yellowbook.com | engraciahuc        |
      | apainb6@google.co.jp        | rosettalightollers |
      | fbawmeb7@studiopress.com    | sherilyngohn       |




@wip
  Scenario Outline: get token for different users
    Given url "https://cybertek-reservation-api-qa3.herokuapp.com"
    And path "/sign"
    And header Accept = "application/json"
    And param email = "<email>"
    And param password = "<password>"
    When method GET
    Then status 200
    * def token = response.accessToken
    Given url "https://cybertek-reservation-api-qa3.herokuapp.com"
    And path "api/users/me"
    And header Authorization = "Bearer " + token
    And header Accept = "application/json"
    When method GET
    Then status 200
    And print response

    Examples:
  |read('data/users.csv')|




#
#  @wip
#  Scenario Outline: Assertion with Api vs DB <email>
#    * def DbUtils = Java.type('utilities.DBUtils')
#    * def query = "select id, firstname, lastname, role from users where email='<email>';"
#    * def dbResult = DbUtils.getRowMap(query)
#    * print "DB RESULT ", dbResult
#    Given url "https://cybertek-reservation-api-qa3.herokuapp.com"
#    And path "/sign"
#    And header Accept = "application/json"
#    And param email = "<email>"
#    And param password = "<password>"
#    When method GET
#    Then status 200
#    * def token = response.accessToken
#    Given url "https://cybertek-reservation-api-qa3.herokuapp.com"
#    And path "api/users/me"
#    And header Authorization = "Bearer " + token
#    And header Accept = "application/json"
#    When method GET
#    Then status 200
#    And print response
#    And match response.firstName == dbResult.firstname
#    And match response.lastName == dbResult.lastname
#    And match response.role == dbResult.role
#
#    Examples:
#    |read('data/users.csv')|