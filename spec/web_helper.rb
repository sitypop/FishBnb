def sign_up
  visit '/users/new'
  expect(page.status_code).to eq 200
  fill_in :first_name,  with: 'Bob'
  fill_in :last_name,   with: 'Smith'
  fill_in :username,    with: 'bob1'
  fill_in :email,       with: 'bob@me.com'
  fill_in :password,    with: 'minions'
  fill_in :password_confirmation, with: 'minions'
  click_button 'Sign up'
end

def sign_in(username:, password:)
  visit 'sessions/new'
  expect(page.status_code).to eq 200
  fill_in :username, with: username
  fill_in :password, with: password
  click_button 'Login'
end
