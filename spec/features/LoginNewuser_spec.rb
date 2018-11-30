feature 'Login into Redmine', js: true do
  scenario 'user registration and log in into redmine' do
    # ! If you add parameter to register (register("some_user")
    # you need to add the same parameter to signin! (signin("some_user"))
  register
  signout
  signin
  expect(page).to have_content "Logged in as #{login}"
  end
end