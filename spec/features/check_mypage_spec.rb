feature 'Check that my page have correct URL and 0 issues', js: true do

  scenario 'Check My Page' do

    @my_account_page = MyAccountPage.new
    @my_account_page.load

    register
    signin
    expect(page).to have_content "Logged in as #{login}"
    @my_account_page.menu.mypage_button.click
    expect(@my_account_page.current_url).to end_with('my/page')
    expect(page).to have_content 'My page'
    expect(@my_account_page.assigned_issues).to have_content 'Issues assigned to me (0)'
    expect(@my_account_page.reported_issues).to have_content 'Reported issues (0)'
  end

end