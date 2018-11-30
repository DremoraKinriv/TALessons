feature "Visit wikipedia page", js: true do

  scenario "unregistered visitor visits home page" do
    visit 'https://en.wikipedia.org'
    expect(page).to have_content 'Welcome to Wikipedia'
    find(:xpath, '//*[@id="mp-topbanner"]/div/div[1]/a').click
    expect(page).to have_content 'From Wikipedia, the free encyclopedia'
  end

end