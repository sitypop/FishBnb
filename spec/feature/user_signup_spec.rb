feature 'User sign up' do

  scenario 'I can sign in as a new user' do
      sign_up
      message = 'Signed in as bob1'
      expect(page).to have_content message
      expect(User.first.email).to eq 'bob@me.com'
    end

  scenario 'Requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'I cannot sign up with an existing email' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end

  scenario 'Missing first name' do
    expect { sign_up(first_name: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('First name must not be blank')
  end

  scenario 'Missing last name' do
    expect { sign_up(last_name: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Last name must not be blank')
  end

  scenario 'Missing username' do
    expect { sign_up(username: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Username must not be blank')
  end

  scenario 'Missing email address' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'Already existing email' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end

  scenario 'Already existing username' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('Username is already taken')
  end

end
