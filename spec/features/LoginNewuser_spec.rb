feature 'Login into Redmine', js: true do

scenario 'user log in into redmine' do
  @loginpage = LoginPage.new
  @loginpage.load

  @loginpage.signin_button.click
  @loginpage.login_field.set 'Newuser'
  @loginpage.password_field.set '123456789'
  @loginpage.login_button.click

  expect(page).to have_content 'Logged in as Newuser'
end
end