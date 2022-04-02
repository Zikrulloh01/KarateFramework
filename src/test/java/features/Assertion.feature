Feature: Assertion In Karate





  Scenario: Matching example
    * def person =
    """
      {
        "name":"Zikrulloh",
        "age":20,
        "gender":"Male"
      }
    """
    * match person.name == "Zikrulloh"
    * match person.age == 20
    * match person.gender != "Female"


  Scenario: Fuzzy matching
    * def person =
    """
      {
        "name":"Zikrulloh",
        "age":20,
        "gender":"Male"
      }
    """
    * match person.name == "#string"
    * match person.age == "#number"
    * match person.salary == "#notpresent"


  Scenario: Contains matching
    * def array =
  """
    [
      {
        "name":"Zikrulloh",
        "age":20,
        "gender":"Male"
      },
      {
        "name":"Ali",
        "age":22,
        "gender":"Male"
      }
    ]
    """
    * def length = array.length
    * print length
    * match length == 2
    * match array contains any {"name":"Ali","age":22,"gender":"Male"}


