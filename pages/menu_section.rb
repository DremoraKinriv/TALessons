class Menu < SitePrism::Section

  element :signin_button, '#account > ul > li:nth-child(1) > a'
  element :register_button, '.register'
  element :mypage_button, '.my-page'
  element :signout_button, '.logout'
  element :projects_button, '#top-menu > ul > li:nth-child(3) > a'
  element :administration_button, '.administration'
  element :projects_button, '.projects'

end
