
#Create unique login, password and email

create_login = Time.now.to_s.gsub(/([ +:-])/, '')
password =  ('0'..'z').to_a.shuffle.first(8).join
email = create_login + "@gmail.com"

feature 'New user registration to Redmine', js: true do

  scenario 'register new user' do
    @main_page = MainPage.new
    @main_page.load
    @register_page = RegisterPage.new
    @register_page.load

    @main_page.register_button.click
    @register_page.login_field.set create_login
    @register_page.password_field.set password
    @register_page.confirmation_field.set password
    @register_page.firstname_field.set 'First'
    @register_page.lastname_field.set 'Last'
    @register_page.email_field.set email
    @register_page.submit_button.click
    sleep 2
    #expect(page).to have_content 'Logged in as Newuser'
  end
end