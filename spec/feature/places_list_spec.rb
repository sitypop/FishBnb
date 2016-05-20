feature 'User can see a list of places' do

  scenario 'multiple availabilities are viewable' do
    sign_up
    add_place
    click_button 'Manage my places'
    click_button 'Add availability'
    fill_in :start_date, with: '20/06/2016'
    fill_in :end_date, with: '20/06/2016'
    click_button 'Confirm'
    visit '/places'
    expect(page).to have_content('Start date: 2016-06-20')
  end

end
