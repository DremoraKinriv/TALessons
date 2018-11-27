When(/^I visit Wikipedia homepage$/) do
  visit 'https://en.wikipedia.org'
end

Then(/^I see "([^"]*)"$/) do |string|
  expect(page).to have_content string
end

When(/^When I click button$/) do
  find(:xpath, '//*[@id="mp-topbanner"]/div/div[1]/a').click
end
# Steps for LoginNewuser feature
When(/^I visit Redmine homepage$/) do
  @main_page.register_button.click
end