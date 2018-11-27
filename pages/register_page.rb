class RegisterPage < SitePrism::Page

  section :menu, Menu,

  set_url "#{$site_url}/account/register"

  element :login_field, '#user_login'
  element :password_field, '#user_password'
  element :confirmation_field, '#user_password_confirmation'
  element :firstname_field, '#user_firstname'
  element :lastname_field, '#user_lastname'
  element :email_field, '#user_mail'
  element :submit_button, '#new_user > input[type="submit"]:nth-child(4)'

end