class IssuesPage < SitePrism::Page
  set_url "#{$site_url}/projects/a#{@project_id}/issues"

  require_relative 'menu_section'
  section :menu, Menu, '#top-menu'

  element :logtime_button, '#content > div:nth-child(1) > a.icon.icon-time-add'
  element :edit_button, '#content > div:nth-child(2) > a.icon.icon-edit'
  element :submit_button, '#issue-form > input[type="submit"]:nth-child(7)'

end