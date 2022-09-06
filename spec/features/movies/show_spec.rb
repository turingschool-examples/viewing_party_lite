require 'rails_helper'

RSpec.describe 'Movies Show Page' do
  it 'has a button to go back to the discover page' do
    user1 = User.create!(name: 'Geraldo', email: 'geraldo@trashtv.com', password: 'password', password_confirmation: 'password')

    visit user_movies_path(user1)

    expect(page).to have_button 'Discover Page'

    click_button 'Discover Page'

    expect(current_path).to eq "/users/#{user1.id}/discover"
  end

  it 'shows all of the details for a specific movie', :vcr do
    user1 = User.create!(name: 'Geraldo', email: 'geraldo@trashtv.com', password: 'password', password_confirmation: 'password')

    visit "users/#{user1.id}/movies/278"

    expect(page).to have_content('The Shawshank Redemption')

    within '#rating-runtime-genres' do
      expect(page).to have_content('8.724')
      expect(page).to have_content('2 h 22 min')
      expect(page).to have_content('Drama, Crime')
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
      expect(page).to have_content('7 Review(s)')
      expect(page).to have_content('Author: elshaarawy')
      expect(page).to have_content('very good movie 9.5/10')
    end
  end

  it 'has a button to create a viewing party for the movie', :vcr do
    user1 = User.create!(name: 'Geraldo', email: 'geraldo@trashtv.com', password: 'password', password_confirmation: 'password')

    visit "users/#{user1.id}/movies/278"

    expect(page).to have_button('Create Viewing Party for The Shawshank Redemption')

    click_button('Create Viewing Party for The Shawshank Redemption')

    expect(current_path).to eq new_user_movie_viewing_party_path(user1, 278)
  end
end
