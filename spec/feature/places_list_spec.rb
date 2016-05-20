feature 'User can see a list of places' do

  scenario 'multiple availabilities are viewable' do
    sign_up
    add_place
    add_availability
    visit '/places'
    expect(page).to have_content('Start date: 2016-06-20')
  end

end
