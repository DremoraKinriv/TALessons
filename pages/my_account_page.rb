class MyAccountPage < SitePrism::Page
  set_url "#{$site_url}/my/account"


  element :signout_button, '.logout'
  element :assigned_issues, '#block-issuesassignedtome > h3'
  element :reported_issues, '#block-issuesreportedbyme > h3'


end