module FeatureHelper
  # Create unique login and password
  def login
    @login ||= Time.now.to_i
  end
  def password
    @password ||=  ('0'..'z').to_a.shuffle.first(8).join
  end
  def register(user=login)
    @main_page = MainPage.new
    @main_page.load
    @register_page = RegisterPage.new
    @register_page.load
    @my_account_page = MyAccountPage.new
    @my_account_page.load
    @loginpage = LoginPage.new
    @loginpage.load

    @main_page.register_button.click
    @register_page.login_field.set user
    @register_page.password_field.set password
    @register_page.confirmation_field.set password
    @register_page.firstname_field.set 'First'
    @register_page.lastname_field.set 'Last'
    @register_page.email_field.set user.to_s + "@gmail.com"
    @register_page.submit_button.click
    @my_account_page.signout_button.click
  end
  def signin(user=login)
    @loginpage = LoginPage.new
    @loginpage.load

    @loginpage.signin_button.click
    @loginpage.login_field.set user
    @loginpage.password_field.set password
    @loginpage.login_button.click
    expect(page).to have_content "Logged in as #{user}"
  end
end
