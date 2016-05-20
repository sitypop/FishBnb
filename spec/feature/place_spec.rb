feature 'Creating a place' do

  scenario 'When logged in I can add a place' do
    sign_up
    add_place
    expect(current_path).to eq '/places'
    expect(Place.first.name).to eq 'Downton Abbey'
    expect(Place.first.user_id).to eq User.first.id
    within 'ul#places' do
      expect(page).to have_content('Downton Abbey')
      expect(page).to have_content('Start date: 2016-06-13')
    end
  end

  scenario 'Place becomes unavailable when request is confirmed' do
    sign_up
    add_place
    sign_up_guest
    click_button 'Request to Book'
    click_button 'Logout'
    login
    click_button 'View received requests'
    click_button 'Accept?'
    click_button 'Back'
    expect(page).to have_content('This place is unavailable')
    expect(Place.first.booked).to be true
  end

end
