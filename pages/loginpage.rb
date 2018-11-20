class LoginPage < SitePrism::Page
  set_url 'http://10.130.75.208'


  element :login_field, '#username'
  element :password_field, '#password'
  element :signin_button, '.login'
  element :login_button, '#login-submit'

end