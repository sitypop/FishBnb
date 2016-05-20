feature 'Host can manage their places' do

  scenario 'only hosts places are visible on the page' do
    sign_up
    add_place
    click_button 'Logout'
    sign_up_guest

    visit '/places/new'
    fill_in 'name', with: 'Buckingham Palace'
    fill_in 'description', with: 'Big house with massive garden'
    fill_in 'price', with: '35'
    fill_in 'availability', with: '15/06/2016'
    click_button 'Add Place'
    click_link 'Manage my places'
    expect(page.status_code).to eq 200
    expect(page).not_to have_content('Downton Abbey')
    expect(page).to have_content('Buckingham Palace')
  end

  scenario 'can see multiple availabilities for a place' do
    sign_up
    add_place
    click_link 'Manage my places'
    click_button 'Add availability'
    fill_in :start_date, with: '20/06/2016'
    click_button 'Confirm'
    visit '/places'
    click_button 'Manage my places'
    expect(page).to have_content('Available on: 2016-06-20')
  end

end
