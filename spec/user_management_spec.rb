feature 'Users' do

  scenario 'Can sign up' do
      sign_up
      message = 'Signed in as bob1'
      expect(page).to have_content message
      expect(User.first.email).to eq 'bob@me.com'
    end

end
