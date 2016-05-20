feature 'Host can change availability on their places' do

  scenario 'Host can add an availability from their places page' do
    sign_up
    add_place
    click_link 'Manage my places'
    click_button 'Add availability'
    expect(page.status_code).to eq 200
    fill_in :start_date, with: '20/06/2016'
    click_button 'Confirm'
    expect(current_path).to eq('/places/manage/availability')
    expect(page).to have_content('Available on: 2016-06-20')
  end

end
