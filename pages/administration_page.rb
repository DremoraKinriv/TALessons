class AdministrationPage < SitePrism::Page

  set_url "#{$site_url}/admin"

  require_relative 'menu_section'

  section :menu, Menu, '#top-menu'

  element :users_button, '#admin-menu > ul > li:nth-child(2) > a'


end