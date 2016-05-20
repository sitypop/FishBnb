feature 'User views a booking page' do

  let!(:user) do
    User.create(first_name: 'Bob',
                last_name: 'Smith',
                username: 'bob1',
                email: 'bob@me.com',
                password: 'minions',
                password_confirmation: 'minions'
                )
  end

  scenario 'user can request to book a place' do
    login(username: user.username, password: user.password)
    add_place
    sign_up_guest
    click_button 'Request to Book'
    expect(page.status_code).to eq 200
    expect(page).to have_content('Your request for Downton Abbey has been sent to host: bob1')
  end

  scenario 'can request a place until it has been approved' do
    login(username: user.username, password: user.password)
    add_place
    click_button 'Request to Book'
    visit '/places'
    expect(page).not_to have_content('This place is unavailable')
  end

  scenario 'user can see their sent requests' do
    login(username: user.username, password: user.password)
    add_place
    sign_up_guest
    click_button 'Request to Book'
    click_button 'Back'
    click_button 'View sent requests'
    expect(page).to have_content('You have requested Downton Abbey')
  end

  scenario 'user can see their received requests' do
    login(username: user.username, password: user.password)
    add_place
    sign_up_guest
    click_button 'Request to Book'
    click_button 'Logout'
    login(username: user.username, password: user.password)
    click_button 'View received requests'
    expect(page).to have_content('Hanna1 has requested Downton Abbey')
  end

  scenario 'host can approve a request' do
    login(username: user.username, password: user.password)
    add_place
    sign_up_guest
    click_button 'Request to Book'
    click_button 'Logout'
    login(username: user.username, password: user.password)
    click_button 'View received requests'
    click_button 'Accept?'
    expect(page.status_code).to eq 200
    expect(page).to have_content('You have approved this request')
  end

  scenario 'host can decline a request' do
    login(username: user.username, password: user.password)
    add_place
    sign_up_guest
    click_button 'Request to Book'
    click_button 'Logout'
    login(username: user.username, password: user.password)
    click_button 'View received requests'
    click_button 'Decline?'
    expect(page.status_code).to eq 200
    expect(page).to have_content('You have declined this request')
  end
end
