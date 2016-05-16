feature 'User login' do

let!(:user) do
  User.create(first_name: 'Bob',
              last_name: 'Smith',
              username: 'bob1',
              email: 'bob@me.com',
              password: 'minions',
              password_confirmation: 'minions'
              )
end

scenario 'with correct credentials' do
  login(username: user.username, password: user.password)
  expect(page).to have_content 'Signed in as bob1'
end

end
