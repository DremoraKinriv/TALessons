Feature: Check if My Page have reported and assigned issues

  Background:
    When I visit Redmine homepage
    And I click Register button
    And I fill Login field
    And I fill Password field
    And I fill Password Confirmation field
    And I fill First name field
    And I fill Last name field
    And I fill Email field
    And I click Submit button
    Then I see "Your account has been activated. You can now log in."

    When I click SignOut button
    Then I see "Home"

    When I visit Redmine homepage
    And I click SignIn button
    And I fill User Login field
    And I fill User Password field
    And I click Login button
    Then I see "Logged in as"

  Scenario:  Check if My Page have reported and assigned issues
    When I visit My Page page
    And I click My Page button
    Then I verify if the URL is right
    And I see "My page"
    And I see "Issues assigned to me"
    And I see "Reported issues"