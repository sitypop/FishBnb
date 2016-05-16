describe User do

  let!(:user) do
    User.create(first_name: 'Bob',
                last_name: 'Smith',
                username: 'bob1',
                email: 'bob@me.com',
                password: 'minions',
                password_confirmation: 'minions'
                )
  end

 it 'authenticates when given a valid username and password' do
   authenticated_user = User.authenticate(user.username, user.password)
   expect(authenticated_user).to eq user
 end

end
