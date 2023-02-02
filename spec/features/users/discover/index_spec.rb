require 'rails_helper'

RSpec.describe 'Users discover index' do
  before(:each) do
    @user_1 = User.create!(name: 'William', email: 'william@gmail.com')
    @user_2 = User.create!(name: 'Christian', email: 'christian@gmail.com')
    @user_3 = User.create!(name: 'Fake', email: 'fake@gmail.com')

    @viewing_party_1 = ViewingParty.create!(title: 'Top Gun', duration: 120, start_time: '14:22', host: @user_2.id)
    @viewing_party_2 = ViewingParty.create!(title: 'Hereditary', duration: 111, start_time: '09:46', host: @user_1.id)
      
    @viewing_party_user_1 = ViewingPartyUser.create!(user_id: @user_1.id, viewing_party_id: @viewing_party_1.id)
    @viewing_party_user_2 = ViewingPartyUser.create!(user_id: @user_2.id, viewing_party_id: @viewing_party_1.id)
    
    visit user_discover_index_path(@user_1)
  end

  it 'has a button to discover top rated movies' do
    expect(page).to have_button('Discover Top Rated Movies')
    save_and_open_page
  end

  it 'has a text field to enter keyword(s) to search by movie title' do
    expect(page).to have_field('Search')
  end

  it 'has a button to search by movie title' do
    expect(page).to have_button('Search by Movie Title')
  end

  describe 'when user clicks on Top Rated Movies' do
    it 'redirects to the movies results page' do
      click_button('Discover Top Rated Movies')
      expect(current_path).to eq(movies_path)
    end
  end

  describe 'when user clicks on search button' do
    it 'redirects to the movies results page' do
      fill_in 'Search', with: 'Top Gun'
      click_button('Search by Movie Title')
      expect(current_path).to eq(movies_path)
      expect(page).to have_content('Top Gun')
    end
  end
end