feature 'User sign up' do

  scenario 'I can sign in as a new user' do
      sign_up
      message = 'Signed in as bob1'
      expect(page).to have_content message
      expect(User.first.email).to eq 'bob@me.com'
    end


end
