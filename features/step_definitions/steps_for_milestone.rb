Given(/^I am not logged in visitor$/) do
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
  @users_page = UsersPage.new
  @users_page.load

  if @register_page.menu.has_signout_button?
    @register_page.menu.signout_button.click
  end
end
When(/^I register "([^"]*)" user via Redmine "([^"]*)"$/) do |role, way|
  if role == "admin" && way == "UI"
    register

  elsif role == "developer" && way == "UI"
    register('developer')
  end
end
And(/^I give him Administrator rights$/) do
  @register_page.menu.signout_button.click
  signin('god') # Login as a Administrator
  @home_page.menu.administration_button.click
  @administration_page.users_button.click
  # if @users_page.has_button_50?
  #   @users_page.button_50.click
  # end
  find_link("#{@admin_user}").click
  check('user[admin]')
  find_button('Save').click
end
Then(/^I see the "([^"]*)" user is registered$/) do |role|

  case role
  when "admin"
    expect(page).to have_content 'Successful update'

  when "developer"
    #typetype
  end

end

And(/^I become logged in as "([^"]*)" user$/) do |role|


end

When(/^I create a project$/) do
  @project_id ||= login
  @home_page.menu.projects_button.click
  @projects_page.new_project_button.click
  @new_project_page.project_name_field.set @project_id
  @new_project_page.identifier_field.set "a#{@project_id}"
  @new_project_page.create_project_button.click
  @new_project_page.menu.projects_button.click

end

Then(/^I see that project is created on "([^"]*)" level$/) do |way|

  case way
  when "UI"
    expect(page).to have_content "#{@project_id}"
  when "API"
    showing_a_project_via_api(@project_id)
  end

end

When(/^I add "([^"]*)" user as a member of the project$/) do |role|

  case role
  when "admin"
    #typetype
  when "developer"
    #typetype
  end

end

Then(/^I can see "([^"]*)" user in the project member list$/) do |role|

  case role
  when "admin"
    #typetype
  when "developer"
    #typetype
  end

end

When(/^I create an issue and assign "([^"]*)" user to created issue$/) do |role|

  case role
  when "admin"
    #typetype
  when "developer"
    #typetype
  end

end

Then(/^I see the issue is created$/) do
  pending
end

And(/^I see "([^"]*)" user is assigned to the issue$/) do |role|

  case role
  when "admin"
    #typetype
  when "developer"
    #typetype
  end

end

When(/^I logout$/) do
  unlogin
end

When(/^I login as "([^"]*)" user$/) do |role|

  unlogin
  case role
  when 'admin'
    signin(@admin_login, @admin_pass)
  when 'developer'
    signin(@dev_login, @dev_pass)
  end

end

When(/^I track time for the assigned issue$/) do
  pending
end

Then(/^I see the time is tracked properly$/) do
  pending
end

When(/^I close the issue$/) do
  pending
end

Then(/^I see the issue was closed$/) do
  pending
end

When(/^I close the project$/) do
  pending
end

Then(/^I see it was successfully closed$/) do
  pending
end

When(/^I create project via api$/) do
  create_project_via_api
end

When(/^I register user via Redmine "([^"]*)"$/) do |way|
  @dev_login = login
  @dev_pass = password
  case way

  when 'API'
    create_user_via_api(@dev_login,@dev_pass)
  when 'UI'
    unlogin

    puts @dev_login
    register(@dev_login, @dev_pass)
  end

end

When(/^I add  user as a "([^"]*)" member of the project$/) do |role|
  case role
  when 'developer'

    find_link(@project_id.to_s).click
    find_button('Settings').click
    find_button('Members').click
    find_button('New member')

  end
end


