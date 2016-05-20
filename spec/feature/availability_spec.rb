feature 'Host can change availability on their places' do

  scenario 'Host can add an availability from their places page' do
    sign_up
    add_place
    add_availability
    expect(current_path).to eq('/places/manage/availability')
    expect(page).to have_content('Start date: 2016-06-20')
  end

  scenario 'Availabilities have a start date and end date' do
    sign_up
    add_place
    add_availability
    expect(page).to have_content('Start date: 2016-06-20')
    expect(page).to have_content('End date: 2016-06-25')
  end

end
