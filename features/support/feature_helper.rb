module FeatureHelper

  def today_date
    @today ||= Time.now.strftime('%m/%d/%Y')
  end
  # Create unique login and password
  def login
    Time.now.to_i
  end
  def password
    ('0'..'z').to_a.shuffle.first(8).join.to_s
  end
  # Store for users credentials
  def user_cred(role='admin', some_login,some_pass)
    if role == 'developer'
          @dev_user = some_login
          @dev_password = some_pass
    elsif role == 'admin'
          @admin_user = some_login
          @admin_password = some_pass
    end
  end

  def register(role='admin', user=login, pass=password)

    @register_page.menu.register_button.click
    @register_page.login_field.set user
    @register_page.password_field.set pass
    @register_page.confirmation_field.set pass
    @register_page.firstname_field.set user
    @register_page.lastname_field.set 'Last'
    @register_page.email_field.set user.to_s + "@gmail.com"
    @register_page.submit_button.click
    # Pass data to user_cred
    user_cred(role, user, pass)
    end

  def signin(role='admin')

    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    # Administrator login and password
    @alogin = 'user'
    @apassword = 'ajMnEkvKGit8'
    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    @loginpage.menu.signin_button.click

    case role
    when 'admin'
     login = @admin_user
     password = @admin_password
    when 'developer'
      login = @dev_user
      password = @dev_password
    when 'god'
      login = @alogin
      password = @apassword
    end
    @loginpage.login_field.set login
    @loginpage.password_field.set password
    @loginpage.login_button.click
  end

  # Sign out with signout button verification
  def signout
    @register_page.menu.signout_button.click
  end

end

World FeatureHelper