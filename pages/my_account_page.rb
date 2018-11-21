class MyAccountPage < SitePrism::Page
  set_url 'http://10.130.75.208/my/account'


  element :signout_button, '.logout'
  element :assigned_issues, '#block-issuesassignedtome > h3'
  element :reported_issues, '#block-issuesreportedbyme > h3'


end