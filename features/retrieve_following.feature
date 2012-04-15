Feature: jammed retrieves users followed by a user

  As a jammed-user
  I want to get all users followed by a user
  So that I can who they follow

  Background:
    Given I use the username "seanslerner"

  Scenario: getting all followed users
    When I get the users they follow
    Then I should see the users they follow

  Scenario: getting all followed users ordered by date
    When I get the users they follow by "date"
    Then I should see the users they follow ordered by "date"

  Scenario: getting all followed users ordered by affinity
    When I get the users they follow by "affinity"
    Then I should see the users they follow ordered by "affinity"

  Scenario: getting all followed users ordered alphabetically 
    When I get the users they follow by "alpha"
    Then I should see the users they follow ordered by "alpha"