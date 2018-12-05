When(/^I register$/) do
  create_user_via_api
end

And(/^I login$/) do
  signin
end

And(/^unlogin$/) do
  signout
end