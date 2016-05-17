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

scenario 'click through to a place\'s page' do
  login(username: user.username, password: user.password)

  visit '/places/new'
  fill_in 'name', with: 'Downton Abbey'
  fill_in 'description', with: 'Charming Victorian manor house'
  fill_in 'price', with: '29'
  click_button 'Add Place'

  click_button 'Book Place now'

  expect(current_path).to eq('/places/' + Place.first(name: 'Downton Abbey').id.to_s)

  expect(page).to have_content('Downton Abbey has been booked')
end

end
