feature 'Host can change availability on their places' do

  scenario 'Host can add an availability from their places page' do
    sign_up
    add_place
    click_button 'Manage my places'
    click_button 'Add availability'
    expect(page.status_code).to eq 200
    fill_in :start_date, with: '20/06/2016'
    fill_in :end_date, with: '20/06/2016'
    click_button 'Confirm'
    expect(current_path).to eq('/places/manage/availability')
    expect(page).to have_content('Start date: 2016-06-20')
  end

  scenario 'Availabilities have a start date and end date' do
    sign_up
    add_place
    click_button 'Manage my places'
    click_button 'Add availability'
    fill_in :start_date, with: '20/06/2016'
    fill_in :end_date, with: '25/06/2016'
    click_button 'Confirm'
    expect(page).to have_content('Start date: 2016-06-20')
    expect(page).to have_content('End date: 2016-06-25')
  end

end
