Feature: Check if My Page have reported and assigned issues

  Background:
    When I create user via api

    When I visit Redmine homepage
    And I click SignIn button
    And I fill User Login field
    And I fill User Password field
    And I click Login button
    Then I see "Logged in as"

  Scenario:  Check if My Page have reported and assigned issues
    When I click My Page button
    Then I verify if the URL is right
    And I see "My page"
    And I see "Issues assigned to me"
    And I see "Reported issues"

    When I delete user via api