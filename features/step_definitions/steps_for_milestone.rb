When(/^I load all the pages$/) do
  @register_page = RegisterPage.new
  @register_page.load
  @my_account_page = MyAccountPage.new
  @my_account_page.load
  @loginpage = LoginPage.new
  @loginpage.load
  @home_page = HomePage.new
  @home_page.load
  @administration_page = AdministrationPage.new
  @administration_page.load
  @projects_page = ProjectsPage.new
  @projects_page.load
  @new_project_page = NewProjectPage.new
  @new_project_page.load
  @project_overview_page = ProjectOverViewPage.new
  @project_overview_page.load
  @spent_time_page = SpentTimePage.new
  @spent_time_page.load
  @issues_page = IssuesPage.new
  @issues_page.load
end

Given(/^I am not logged in visitor$/) do
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
  end
end

And(/^I give him Administrator rights$/) do
  @register_page.menu.signout_button.click
  signin('god') # Login as a Administrator
  @home_page.menu.administration_button.click
  @administration_page.users_button.click
  find_link("#{@admin_user}").click
  check('user[admin]')
  find_button('Save').click
end

Then(/^I see the "([^"]*)" user is updated$/) do |role|
  case role
  when 'admin'
    expect(page).to have_content 'Successful update'
  when 'developer'
    # We can create developer only when we assign him to a project
  end
end

Then(/^I see the "([^"]*)" user is registered$/) do |role|
  case role
  when 'admin'
    expect(page).to have_content 'Your account has been activated. You can now log in.'
  when 'developer'
    # We can create developer only when we assign him to a project
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
  end
end

When(/^I create a project$/) do
  @project_id ||= "a#{login}"
  @home_page.menu.projects_button.click
  @projects_page.new_project_button.click
  @new_project_page.project_name_field.set @project_id
  @new_project_page.identifier_field.set @project_id
  check('Bug')
  @new_project_page.create_project_button.click
  @new_project_page.menu.projects_button.click
end

Then(/^I see that project is created on "([^"]*)" level$/) do |way|
  case way
  when 'UI'
    expect(page).to have_content @project_id
  when 'API'
    showing_a_project_via_api(@project_id)
  end
end

Then(/^I can see "([^"]*)" user in the project member list$/) do |role|
  case role
  when 'admin'
    #typetype
  when 'developer'
    expect(page).to have_content "#{@dev_user}"
  end
end

When(/^I create an issue and assign "([^"]*)" user to created issue$/) do |role|
  @issue_subject ||= login
  case role
  when 'admin'
    #typetype
  when 'developer'
    @project_overview_page.plus_button.click
    @project_overview_page.new_issue_button.click
    @project_overview_page.subject_field.set @issue_subject
    select("#{@dev_user}", :from => 'Assignee')
    @project_overview_page.create_issue_button.click
  end
end

Then(/^I see the issue is created$/) do
  expect(page).to have_content 'created.'
end

And(/^I see "([^"]*)" user is assigned to the issue$/) do |role|
  case role
  when 'admin'
    #typetype
  when 'developer'
    expect(page).to have_content "#{@dev_user} Last"
  end
end

When(/^I logout$/) do
  unlogin
end

When(/^I login as "([^"]*)" user$/) do |role|
  signin(role)
end

When(/^I track time for the assigned issue$/) do
  @home_page.menu.mypage_button.click
  find_link('Issues assigned to me').click
  find_link("#{@issue_subject}").click
  @issues_page.logtime_button.click
  @spent_time_page.date_field.set todays_day
  @spent_time_page.hours_field.set 8
  select('Development', :from => 'Activity')
  @spent_time_page.create_button.click
end

Then(/^I see the time is tracked properly$/) do
  expect(page).to have_content 'Successful creation.'
  expect(page).to have_css('div', :text => "#{@todays_day}")
  expect(page).to have_css('div', :text => 8)
end

When(/^I close the issue$/) do
  @issues_page.edit_button.click
  select('Closed', :from => 'Status')
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
    find_link('New member').click
    @project_overview_page.search_field.set @dev_user
    @project_overview_page.member_checkbox.check
    check('Developer')
    @project_overview_page.add_button.click
  end
end

Then(/^i see sign in error$/) do
  expect(page).to have_content 'Invalid user or password'
end