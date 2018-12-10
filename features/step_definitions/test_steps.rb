When(/^I register$/) do

  puts showing_a_user_via_api.code
  end

And(/^I login$/) do
  signin
end

And(/^unlogin$/) do
  signout
end