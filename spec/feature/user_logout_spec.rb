feature 'User signs out' do

  let!(:user) do
    User.create(first_name: 'Bob',
                last_name: 'Smith',
                username: 'bob1',
                email: 'bob@me.com',
                password: 'minions',
                password_confirmation: 'minions'
                )
  end

  scenario 'while being signed in' do
    login(username: user.username, password: user.password)
    click_button 'Logout'
    message = 'Signed in as bob1'
    expect(page).to_not have_content message
  end
end
