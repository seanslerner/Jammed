Feature: jammed retrieves a user's jams

  As a jammed-user
  I want to retrieve a user's jams
  So that I can access the data

  Background:
    Given I use the username "seanslerner"

  Scenario: getting all jams
    When I get their "jams"
    Then I should see their "jams"

  Scenario: getting past jams
    When I get their "past jams"
    Then I should see their "past jams"
    But I should not see their "current jam"

  Scenario: getting current jam
    When I get their "current jam"
    Then I should see their "current jam"
    But I should not see their "past jams"