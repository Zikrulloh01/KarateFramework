@all
Feature: Welcome to Karate
  
  
  Scenario: How to print
    Given print "Hello !!!!!!"
    When print "Hello !!!!!!2"
    Then print "Hello !!!!!!3"


  Scenario: More printing
    Given print "some words to print"
    * print "My name is","Zikrulloh Islomov"
   * print 2 + 3



  Scenario: Variables
    * def name = "Ali"
    * print "My name is " + name
    * def age = 22
    * print name + " is at the age of " + age



  Scenario: difficult parameters : json object
    * def student = {"name":"Zikrulloh", "hasFriends":false}
    * print student
    * print student.name
    * print student.hasFriends

    

  Scenario: json object 2
    * def student =
    """
    {
      firstName : "Zikrulloh",
      lastName : "Islomov",
      salary : 50000
    }
    """
    * print student


  Scenario: Spartan Variable
    * def spartan =
      """
      {
        "id": 7,
        "name": "Hershel",
        "gender": "Male",
        "phone": 5278678322
       }
      """
      * print spartan.name
      * print spartan.gender
      * print spartan.phone



  Scenario: Json Array structure
    * def students =
    """
    [
      {
        "name": "Hershel",
        "gender": "Male"
      }
      {
        "name": "Alisher",
        "gender": "Male"
      }
      {
        "name": "Aziza",
        "gender": "Female"
      }
    ]
    """
    * print students[0].name
    * print students[1].name
    * print students[1].gender
    * print students[2].name
    * print students[2].name, students[2].gender

  
  





