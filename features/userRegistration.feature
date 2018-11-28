Feature: Registration for New User

  Scenario: User register to Redmine page and log out

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

    When