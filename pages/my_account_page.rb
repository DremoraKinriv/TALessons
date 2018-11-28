class MyAccountPage < SitePrism::Page

  set_url "#{$site_url}/my/account"

  require_relative 'menu_section'

  section :menu, Menu, '#top-menu'

  element :assigned_issues, '#block-issuesassignedtome > h3'
  element :reported_issues, '#block-issuesreportedbyme > h3'


end