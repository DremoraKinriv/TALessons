feature "Login into Redmine", js: true do



  scenario "user log in into redmine" do
    visit 'http://10.130.75.208'
    find(:xpath, '//*[@id="account"]/ul/li[1]/a').click
    within("#login-form") do
      fill_in 'username', with: 'Newuser'
      fill_in 'password', with: '123456789'
    end
    click_button 'Login'
    expect(page).to have_content 'Logged in as Newuser'


  end
end

