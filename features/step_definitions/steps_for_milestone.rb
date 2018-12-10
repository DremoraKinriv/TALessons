
Given(/^I am not logged in visitor$/) do
  @home_page.load
  expect(page).to have_content 'Register'
end

When(/^I register "([^"]*)" user via Redmine "([^"]*)"$/) do |role, way|
  if role == 'admin' && way == 'UI'
    register
  elsif role == 'developer' && way == 'UI'
    register('developer')
  elsif role == 'developer' && way == 'API'
    create_user_via_api('developer')
  elsif role == 'admin' && way == 'API'
    create_user_via_api('admin')
  else
    raise 'Please write role of the user and creation level (developer or admin for user and UI or API for Redmine)'
  end
end

And(/^I give him Administrator rights$/) do
  @register_page.menu.signout_button.click
  signin('god') # Login as a Administrator
  @home_page.menu.administration_button.click
  @administration_page.users_button.click
  find_link("#{@admin_user}").click
  check('Administrator')
  find_button('Save').click
end

Then(/^I see the "([^"]*)" user is updated$/) do |role|
  case role
  when 'admin'
    expect(page).to have_content 'Successful update'
  when 'developer'
    expect(showing_a_user_via_api('role').code == 200)
  else
    raise 'Please write proper role of the user (developer or admin)'
  end
end

Then(/^I see the "([^"]*)" user is registered$/) do |role|
  case role
  when 'admin'
    expect(page).to have_content 'Your account has been activated. You can now log in.'
  when 'developer'
    expect(showing_a_user_via_api('role').code == 200)
  else
    raise 'Please write proper role of the user (developer or admin)'
  end
end

When(/^I become logged in as "([^"]*)" user$/) do |role|
  case role
  when 'god'
    expect(page).to have_content "Logged in as #{@alogin}"
  when 'admin'
    expect(page).to have_content "Logged in as #{@admin_user}"
  when 'developer'
    expect(page).to have_content "Logged in as #{@dev_user}"
  else
    raise 'Please write proper role of the user (developer, admin or god)'
  end
end

When(/^I create a project$/) do
  @project_id ||= "a#{login}"
  @home_page.menu.projects_button.click
  @projects_page.new_project_button.click
  @new_project_page.project_name_field.set @project_id
  @new_project_page.identifier_field.set @project_id
  @new_project_page.bug_checkbox.check
  @new_project_page.create_project_button.click
  @new_project_page.menu.projects_button.click
end

Then(/^I see that project is created on "([^"]*)" level$/) do |way|
  case way
  when 'UI'
    expect(page).to have_content @project_id
  when 'API'
    showing_a_project_via_api(@project_id)
  else
    raise 'Please write proper name of creation level (UI or API)'
  end
end

Then(/^I can see "([^"]*)" user in the project member list$/) do |role|
  case role
  when 'developer'
    expect(page).to have_content "#{@dev_user}"
  else
    raise 'Please write a roper role of the user (for now only developer role is available)'
  end
end

When(/^I create an issue and assign "([^"]*)" user to created issue$/) do |role|
  @issue_subject ||= login
  case role
  when 'developer'
    @project_overview_page.plus_button.click
    @project_overview_page.new_issue_button.click
    @project_overview_page.subject_field.set @issue_subject
    @project_overview_page.assignee_options.select("#{@dev_user}")
    @project_overview_page.create_issue_button.click
  else
    raise 'Please write a roper role of the user (for now only developer role is available)'
  end
end

Then(/^I see the issue is created$/) do
  expect(page).to have_content 'created.'
end

And(/^I see "([^"]*)" user is assigned to the issue$/) do |role|
  case role
  when 'developer'
    expect(page).to have_content "#{@dev_user} Last"
  else
    raise 'Please write a roper role of the user (for now only developer role is available)'
  end
end

When(/^I logout$/) do
  signout
end

When(/^I login as "([^"]*)" user$/) do |role|
  signin(role)
end

When(/^I track time for the assigned issue$/) do
  @home_page.menu.mypage_button.click
  @my_account_page.assigned_issues_link.click
  find_link("#{@issue_subject}").click
  @issues_page.logtime_button.click
  @spent_time_page.date_field.set today_date
  @spent_time_page.hours_field.set 8
  @spent_time_page.activity_options.select('Development')
  @spent_time_page.create_button.click
end

Then(/^I see the time is tracked properly$/) do
  expect(page).to have_content 'Successful creation.'
  expect(page).to have_css('div', :text => today_date)
  expect(page).to have_css('div', :text => 8)
end

When(/^I close the issue$/) do
  @issues_page.edit_button.click
  @issues_page.status_option.select('Closed')
  @issues_page.submit_button.click
end

Then(/^I see the issue was closed$/) do
  expect(page).to have_css('div', :text => 'Closed')
end

When(/^I close the project$/) do
  @home_page.menu.projects_button.click
  find_link(@project_id).click

  accept_alert do
    @project_overview_page.close_project_button.click
  end
end

Then(/^I see it was successfully closed$/) do
  expect(page).to have_content 'This project is closed and read-only'
end

When(/^I create project via api$/) do
  create_project_via_api
end

When(/^I delete all$/) do
  delete_user_via_api(@admin_user)
  delete_user_via_api(@dev_user)
  deleting_project_via_api(@project_id)
end

When(/^I add "([^"]*)" user as a member of the project$/) do |role|
  case role
  when 'developer'
    find_link(@project_id.to_s).click
    @project_overview_page.settings_tab.click
    @project_overview_page.members_tab.click
    @project_overview_page.new_member_button.click
    @project_overview_page.search_field.set @dev_user
    @project_overview_page.member_checkbox.check
    @project_overview_page.developer_checkbox.check
    @project_overview_page.add_button.click
  else
    raise 'Please write a roper role of the user (for now only developer role is available)'
  end
end

Then(/^i see sign in error$/) do
  expect(page).to have_content 'Invalid user or password'
end