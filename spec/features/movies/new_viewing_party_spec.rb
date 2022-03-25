require 'rails_helper'

RSpec.describe 'new viewing party page' do
  before(:each) do
    @user = User.create!(name: 'Kat', email: 'kat@yahoo.com')
  end

  it "has a title" do
    VCR.use_cassette('top_20_api') do
      visit user_discover_index_path(@user)
      click_on 'Find Top Rated Movies'
      click_on 'The Shawshank Redemption'
      click_on 'Create Viewing Party for The Shawshank Redemption'

      expect(page).to have_content("Create a Movie Party for The Shawshank Redemption")
    end
  end

  it "has a button to the discover page" do
    VCR.use_cassette('top_20_api') do
      visit user_discover_index_path(@user)
      click_on 'Find Top Rated Movies'
      click_on 'The Shawshank Redemption'
      click_on 'Create Viewing Party for The Shawshank Redemption'
      click_on 'Discover Page'

      expect(current_path).to eq(user_discover_index_path(@user))
    end
  end

  it "has a party details section header" do
    VCR.use_cassette('top_20_api') do
      visit user_discover_index_path(@user)
      click_on 'Find Top Rated Movies'
      click_on 'The Shawshank Redemption'
      click_on 'Create Viewing Party for The Shawshank Redemption'

      expect(page).to have_content('Viewing Party Details')
      expect(page).to have_content('Movie Title')
    end
  end

  it "Has a form to fill out with duration day and time of the party with leangth
  of the movie in mins" do
    VCR.use_cassette('top_20_api') do
      visit user_discover_index_path(@user)
      click_on 'Find Top Rated Movies'
      click_on 'The Shawshank Redemption'
      click_on 'Create Viewing Party for The Shawshank Redemption'
      expect(page).to have_content('Duration of party')
      expect(page).to have_content('Day')
      expect(page).to have_content(142)
      expect(page).to have_content('Start time')
    end
  end

  it "has checkboxes with other users on the sites names and emails" do
    VCR.use_cassette('top_20_api') do
      visit user_discover_index_path(@user)
      click_on 'Find Top Rated Movies'
      click_on 'The Shawshank Redemption'
      click_on 'Create Viewing Party for The Shawshank Redemption'

      @user2 = User.create!(name: 'Carle', email: 'carle@gmail.com')
      @user3 = User.create!(name: 'Jess', email: 'jess@gmail.com')

      expect(page).to have_content('Carle')
      expect(page).to have_content('carle@gmail.com')
      expect(page).to have_content('Jess')
      expect(page).to have_content('jess@gmail.com')
    end
  end
end
