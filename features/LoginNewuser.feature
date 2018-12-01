Feature: Login New User

  Background:
    When I create user via api

  Scenario: User register to Redmine page and log in

    When I visit Redmine homepage
    And I click SignIn button
    And I fill User Login field
    And I fill User Password field
    And I click Login button
    Then I see "Logged in as"

    When I delete user via api