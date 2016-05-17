feature 'User sign up' do

  scenario 'I can sign in as a new user' do
      sign_up
      message = 'Signed in as bob1'
      expect(page).to have_content message
      expect(User.first.email).to eq 'bob@me.com'
    end

  scenario 'with a password that does not match' do
    visit '/users/new'
    expect(page.status_code).to eq 200
    fill_in :first_name,  with: 'Bob'
    fill_in :last_name,   with: 'Smith'
    fill_in :username,    with: 'bob1'
    fill_in :email,       with: 'bob@me.com'
    fill_in :password,    with: 'minions'
    fill_in :password_confirmation, with: 'wrong'
    click_button 'Sign up'
      # expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
      expect(current_path).to eq('/users')
      expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'I cannot sign up with an existing email' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end

end
