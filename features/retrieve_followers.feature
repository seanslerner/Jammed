Feature: jammed retrieves users following a user
  
  As a jammed-user
  I want to get all users following a user
  So that I can see who follows them?

  Background:
    Given I use the username "seanslerner"

  Scenario: get all followers
    When I get their followers
    Then I should see who follows them

  Scenario: get followers ordered by date
    When I get their followers ordered by "date"
    Then I should see their followers ordered by "date"

  Scenario: get followers ordered by likes
    When I get their followers ordered by "likes"
    Then I should see their followers ordered by "likes"

  Scenario: get followers ordered alphabetically
    When I get their followers ordered by "alpha"
    Then I should see their followers ordered by "alpha"