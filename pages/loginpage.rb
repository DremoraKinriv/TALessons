class LoginPage < SitePrism::Page
  set_url $site_url

  section :menu, Menu,

  element :login_field, '#username'
  element :password_field, '#password'
  element :login_button, '#login-submit'

end