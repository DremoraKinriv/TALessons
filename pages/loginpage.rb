class LoginPage < SitePrism::Page
  set_url $site_url

  element :login_field, '#username'
  element :password_field, '#password'
  element :signin_button, '.login'
  element :login_button, '#login-submit'

end