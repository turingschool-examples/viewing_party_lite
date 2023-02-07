require 'rails_helper'

RSpec.describe 'Movies Show Page' do
  let!(:users) { create_list(:user, 3) }
  let!(:user1) { users.first }
  let!(:user2) { users.second }
  let!(:user3) { users.third }

  it 'has a button to go back to the discover page' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

    visit movies_path

    expect(page).to have_button 'Discover Page'

    click_button 'Discover Page'

    expect(current_path).to eq(discover_path)
  end

  it 'shows all of the details for a specific movie', :vcr do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

    visit movie_path(278)

    expect(page).to have_content('The Shawshank Redemption')

    within '#rating-runtime-genres' do
      expect(page).to have_content('Vote Average: 8.7')
      expect(page).to have_content('Runtime: 2 h 22 min')
      expect(page).to have_content('Genre(s): Drama, Crime')
    end

    within '#summary-section' do
      expect(page).to have_content('Framed in the 1940s for the double murder')
    end

    within '#cast-section' do
      expect(page).to have_css('#character-1')
      expect(page).to have_css('#character-10')
      expect(page).to_not have_css('#character-11')
    end

    within '#reviews-section' do
      expect(page).to have_content('8 Review(s)')
      expect(page).to have_content('Author: elshaarawy')
      expect(page).to have_content('very good movie 9.5/10')
    end
  end

  it 'has a button to create a viewing party for the movie', :vcr do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

    visit movie_path(278)

    expect(page).to have_button('Create Viewing Party for The Shawshank Redemption')

    click_button('Create Viewing Party for The Shawshank Redemption')

    expect(current_path).to eq new_movie_viewing_party_path(278)
  end
end
