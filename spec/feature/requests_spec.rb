feature 'User can make and process requests' do

  scenario 'user can request to book a place' do
    sign_up
    add_place
    sign_up_guest
    click_button 'Request to Book'
    expect(page.status_code).to eq 200
    expect(page).to have_content('Your request for Downton Abbey has been sent to host: bob1')
    expect(Request.all).not_to be_empty
  end

  scenario 'guest can see their sent requests' do
    sign_up
    add_place
    sign_up_guest
    click_button 'Request to Book'
    click_link 'View sent requests'
    expect(page).to have_content('You have requested Downton Abbey')
  end

  scenario 'host can see their received requests' do
    sign_up
    add_place
    sign_up_guest
    click_button 'Request to Book'
    click_button 'Logout'
    login
    click_link 'View received requests'
    expect(page).to have_content('Hanna1 has requested Downton Abbey')
  end

  scenario 'host can approve a request' do
    sign_up
    add_place
    sign_up_guest
    click_button 'Request to Book'
    click_button 'Logout'
    login
    click_link 'View received requests'
    click_button 'Accept?'
    expect(page.status_code).to eq 200
    expect(page).to have_content('You have approved this request')
    expect(Request.first.approved).to be true
  end

  scenario 'host can decline a request' do
    sign_up
    add_place
    sign_up_guest
    click_button 'Request to Book'
    click_button 'Logout'
    login
    click_link 'View received requests'
    click_button 'Decline?'
    expect(page.status_code).to eq 200
    expect(page).to have_content('You have declined this request')
    expect(Request.first.declined).to be true
  end
end
