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

def login(username:, password:)
  visit 'sessions/new'
  expect(page.status_code).to eq 200
  fill_in :username, with: username
  fill_in :password, with: password
  click_button 'Login'
end

def add_place(name:, description:, price:)
  visit '/places'
  click_button 'Add new place'
  fill_in :name, with: name
  fill_in :description, with: description
  fill_in :price, with: price
  click_button 'Add Place'
end
