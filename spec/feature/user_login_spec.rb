feature 'User login' do

scenario 'with correct credentials' do
  sign_up
  click_button 'Logout'
  login
  expect(page).to have_content 'Signed in as bob1'
end

end
