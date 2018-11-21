feature 'New user registration to Redmine and log in ', js: true do

  scenario 'register new user' do

    register
    expect(page).to have_content "Your account has been activated. You can now log in."
  end
end

