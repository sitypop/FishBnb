feature 'Creating a place' do

  let!(:user) do
    User.create(first_name: 'Bob',
                last_name: 'Smith',
                username: 'bob1',
                email: 'bob@me.com',
                password: 'minions',
                password_confirmation: 'minions'
                )
  end

  scenario 'When logged in I can add a place' do
    login(username: user.username, password: user.password)
    add_place
    expect(current_path).to eq '/places'
    expect(Place.first.user_id).to eq user.id

    within 'ul#places' do
      expect(page).to have_content('Downton Abbey')
      expect(page).to have_content('Available on: 2016-06-13')
    end
  end

  scenario 'Place becomes unavailable when request is confirmed' do
    login(username: user.username, password: user.password)
    add_place
    sign_up_guest
    click_button 'Request to Book'
    click_button 'Logout'
    login(username: user.username, password: user.password)
    click_link 'View received requests'
    click_button 'Accept?'
    click_button 'Back'
    expect(page).to have_content('This place is unavailable')
  end

end
