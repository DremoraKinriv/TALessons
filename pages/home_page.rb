class HomePage < SitePrism::Page
  set_url $site_url

  require_relative 'menu_section'

  section :menu, Menu, '#top-menu'


end