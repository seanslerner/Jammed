Feature: jammed retrieves a users likes

  As a jammed-user
  I want to retrieve a user's likes
  So that I can access the jams they like and have liked

  Background: 
    Given I use the username "seanslerner"

  Scenario: getting all likes
    When I get their "likes"
    Then I should see their "likes"

  Scenario: getting current likes
    When I get their "current likes"
    Then I should see their "current likes"
    And I should not see their "past likes"

  Scenario: getting past likes  
    When I get their "past likes"
    Then I should see their "past likes"
    And I should not see their "current likes"