class UsersPage < SitePrism::Page

  set_url "#{$site_url}/users"

  require_relative 'menu_section'

  section :menu, Menu, '#top-menu'

  element :button_50, '50'



end