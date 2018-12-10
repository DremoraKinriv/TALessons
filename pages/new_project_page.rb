class NewProjectPage < SitePrism::Page
  set_url "#{$site_url}/projects/new"

  require_relative 'menu_section'
  section :menu, Menu, '#top-menu'

  element :project_name_field, '#project_name'
  element :create_project_button, '#new_project > input[type="submit"]:nth-child(7)'
  element :identifier_field, '#project_identifier'
  element :bug_checkbox, '#project_trackers > label:nth-child(2) > input[type="checkbox"]'
end