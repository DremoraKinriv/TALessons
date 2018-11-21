class MainPage < SitePrism::Page
  set_url 'http://10.130.75.208'

  element :register_button, '.register'
  element :signin_button, '.login'


end