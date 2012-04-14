Feature: jammed retrieves person data

  As a jammed-user
  I want to retrieve user data
  So that I can extract specific information

  Scenario: retrieving all user data
    Given I use the username "IFTFOM"
    When I call the api for "profile"
    Then I should receive all the user info

  Scenario: retrieving just the user's name
    Given I use the username "IFTFOM"
    When I call the api for "name"
    Then I should recieve the name
    But I should not recieve anything else

  Scenario: error if unknown username used
    Given I use the username "ThisUserNameShouldNeverExist"
    When I call the api for "profile"
    Then I should recieve an error
