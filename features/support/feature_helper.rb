module FeatureHelper
  # Create unique login and password
  def login
    Time.now.to_i
  end
  def password
    ('0'..'z').to_a.shuffle.first(8).join.to_s
  end
  def user_cred(role='admin', some_login,some_pass)
    if role == 'developer'
          @dev_user = some_login
          @dev_password = some_pass
        elsif role == 'admin'
          @admin_user = some_login
          @admin_password = some_pass
      end
  end

  def alogin
    @alogin = 'user'
    @apassword = 'ajMnEkvKGit8'
  end

  def register(role='admin', user=login, pass=password)
    @register_page = RegisterPage.new
    @register_page.load

    @register_page.menu.register_button.click
    @register_page.login_field.set user
    @register_page.password_field.set pass
    @register_page.confirmation_field.set pass
    @register_page.firstname_field.set 'First'
    @register_page.lastname_field.set 'Last'
    @register_page.email_field.set user.to_s + "@gmail.com"
    @register_page.submit_button.click

    user_cred(role, user, pass)
    end

  def signin(role='admin', user=@admin_user, pass=@admin_password)
    @loginpage = LoginPage.new
    @loginpage.load

    @loginpage.menu.signin_button.click
    case role
    when 'admin'
      @loginpage.login_field.set user
      @loginpage.password_field.set pass
      @loginpage.login_button.click
      expect(page).to have_content "Logged in as #{user}"
    when 'developer'
      @loginpage.login_field.set @dev_user
      @loginpage.password_field.set @dev_password
      @loginpage.login_button.click
      expect(page).to have_content "Logged in as #{@dev_user}"
    when 'god'
    @loginpage.login_field.set 'user'
    @loginpage.password_field.set 'ajMnEkvKGit8'
    @loginpage.login_button.click
    expect(page).to have_content "Logged in as user"
    end
  end

  def signout
    @my_account_page = MyAccountPage.new
    @my_account_page.load

    @my_account_page.menu.signout_button.click
  end

  def unlogin
    if @register_page.menu.has_signout_button?
      @register_page.menu.signout_button.click
    end
  end
  end

World FeatureHelper