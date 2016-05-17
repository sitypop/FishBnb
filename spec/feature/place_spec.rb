feature 'Creating a place' do

  scenario 'I can add a place' do
    visit '/places/new'
    fill_in 'name', with: 'Downton Abbey'
    fill_in 'description', with: 'Charming Victorian manor house'
    fill_in 'price', with: '29'
    click_button 'Add Place'

    expect(current_path).to eq '/places'

    within 'ul#places' do
      expect(page).to have_content('Downton Abbey')
    end
  end
end
