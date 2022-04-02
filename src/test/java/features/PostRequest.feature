Feature: Karate Java Integration




  Background:
    # Creating urls globally and widely use them in any test steps later
    * def baseUrl = "http://api.exchangeratesapi.io/v1/?access_key=29abf879f3cdad157136b20a7cbaa1b2"
    * def spartanUrl = "http://100.26.102.120:8000"
    * def hr_url = "http://100.26.102.120:1000/ords/hr"





    Scenario: Get a spartan with request header
      Given url spartanUrl
      And path "/api/spartans"
      And header Accept = "application/json"
      When method GET
      Then status 200






  Scenario: Get a spartan with request header
    Given url spartanUrl
    And path "/api/spartans"
    And header Accept = "application/json"
    And header Content-Type = "application/json"
    And request
    """
      {
        "gender":"Male",
        "name":"Aziz",
        "phone":998950051313
      }
    """
    When method POST
    Then status 201
    Then print response
    And match response.success == "A Spartan is Born!"


    #Reading data from a java source code
    Scenario: Reading java methods through utility
      * def SDG = Java.type('utilities.SpartanDataGenerator')
      * def newSpartan = SDG.createSpartan()
      * print newSpartan


  @wip
  Scenario: Create Spartan using Random Data Generator
    * def SDG = Java.type('utilities.SpartanDataGenerator')
       #creating an object from SpartanDataGenerator class
    * def newSpartan = SDG.createSpartan()
      #assigning created object into a spartan variable
    Given url spartanUrl
    And path "/api/spartans"
      #defining expected file type as json
    And header Accept = "application/json"
      #defining what kind of data format we are going to post >>> json
    And header Content-Type = "application/json"
     # posting the assigned spartan to the api
    And request newSpartan
    # method type is post as we are sending data
    When method POST
    # verify status code
    Then status 201
    And print response
    # Assertion success message
    Then match response.success == "A Spartan is Born!"
      #Verify names
    And match response.data.name == newSpartan.name
      # Jumping to the delete request by getting the id of posted spartan and saving it into a variable
    And def idToDelete = response.data.id
    Given url spartanUrl
    And path "api/spartans"
    # passing the id as part of url as shown in documentation
    And path idToDelete
    # request type delete
    When method delete
    # status code assertion
    Then status 204


