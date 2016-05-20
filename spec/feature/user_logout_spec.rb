feature 'User signs out' do

  scenario 'while being signed in' do
    sign_up
    click_button 'Logout'
    message = 'Signed in as bob1'
    expect(page).to_not have_content message
  end
end
