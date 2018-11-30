class Menu < SitePrism::Section

  element :signin_button, '#account > ul > li:nth-child(1) > a'
  element :register_button, '.register'
  element :mypage_button, '.my-page'
  element :signout_button, '.logout'

end
