class LoginPage < SitePrism::Page
  set_url "#{$site_url}/login"

 require_relative 'menu_section'

  section :menu, Menu, '#top-menu'

  element :login_field, '#username'
  element :password_field, '#password'
  element :login_button, '#login-submit'

end