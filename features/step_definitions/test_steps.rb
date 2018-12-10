When(/^I register$/) do

  create_user_via_api
  puts
  end

And(/^I login$/) do
  signin
end

And(/^unlogin$/) do
  signout
end