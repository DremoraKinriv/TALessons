class ProjectOverViewPage < SitePrism::Page
  set_url "#{$site_url}/projects/a#{@project_id}"

  require_relative 'menu_section'
  section :menu, Menu, '#top-menu'

  element :settings_tab, :xpath, '//*[@id="main-menu"]/ul/li[12]/a'
  element :members_tab, '#tab-members'
  element :search_field, '#principal_search'
  element :member_checkbox, '#principals > label > input[type="checkbox"]'
  element :developer_checkbox, '#new_membership > fieldset:nth-child(3) > div > label:nth-child(2) > input[type="checkbox"]'
  element :add_button, '#member-add-submit'
  element :plus_button, '#new-object'
  element :new_issue_button, '#main-menu > ul > li:nth-child(1) > ul > li:nth-child(1) > a'
  element :subject_field, '#issue_subject'
  element :assignee_options, '#issue_assigned_to_id'
  element :create_issue_button, '#issue-form > input[type="submit"]:nth-child(4)'
  element :close_project_button, '#content > div.contextual > a.icon.icon-lock'
end