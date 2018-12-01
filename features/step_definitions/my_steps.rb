
# user = login

When(/^I visit Wikipedia homepage$/) do
  visit 'https://en.wikipedia.org'
end

Then(/^I see "([^"]*)"$/) do |string|
  expect(page).to have_content string
end

When(/^When I click button$/) do
  find(:xpath, '//*[@id="mp-topbanner"]/div/div[1]/a').click
end


# Steps for userRegistration feature:

When(/^I visit Redmine homepage$/) do
  @register_page = RegisterPage.new
  @register_page.load
  @my_account_page = MyAccountPage.new
  @my_account_page.load
  @loginpage = LoginPage.new
  @loginpage.load
  @home_page = HomePage.new
  @home_page.load
end

And(/^I click Register button$/) do
  @home_page.menu.register_button.click
end

And (/^I fill Login field$/) do
  @register_page.login_field.set login
end

And(/^I fill Password field$/) do
  @register_page.password_field.set password
end

And(/^I fill Password Confirmation field$/) do
  @register_page.confirmation_field.set password
end

And(/^I fill First name field$/) do
  @register_page.firstname_field.set 'First'
end

And(/^I fill Last name field$/) do
  @register_page.lastname_field.set 'Last'
end

And(/^I fill Email field$/) do
  @register_page.email_field.set login.to_s + "@gmail.com"
end

And(/^I click Submit button$/) do
  @register_page.submit_button.click
end

When(/^I click SignOut button$/) do
  @register_page.menu.signout_button.click
end


And(/^I click Login button$/) do
  @loginpage.login_button.click
end

And(/^I click SignIn button$/) do
  @register_page.menu.signin_button.click
end

And(/^I fill User Login field$/) do
  @loginpage.login_field.set login
end

And(/^I fill User Password field$/) do
  @loginpage.password_field.set password
end

When(/^I click My Page button$/) do
  @my_account_page.menu.mypage_button.click
end

Then(/^I verify if the URL is right$/) do
  expect(@my_account_page.current_url).to end_with('my/page')
end

When(/^I create user via api$/) do
  create_user_via_api
end

And(/^I delete user via api$/) do
  delete_user_via_api
end