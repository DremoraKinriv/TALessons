class MainPage < SitePrism::Page
  set_url $site_url

  element :register_button, '.register'
  element :signin_button, '.login'
  element :mypage_button, '.my-page'


end