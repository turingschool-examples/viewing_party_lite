# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Movie Index Page' do
  before(:each) do
    @vp1 = ViewingParty.create!(movie_id: 111, duration: 151, date: Time.new(2022, 0o4, 12, 21, 0o0),
                                start_time: Time.new(2022, 0o4, 12, 21, 0o0))
    @vp2 = ViewingParty.create!(movie_id: 112, duration: 152, date: Time.new(2022, 0o4, 11, 20, 30),
                                start_time: Time.new(2022, 0o4, 11, 20, 30))
    @user1 = User.create!(name: 'Becky', email: 'becky@example.com')
    @user2 = User.create!(name: 'Steven', email: 'steven@example.com')
    @user5 = User.create!(name: 'Bruce', email: 'Bruce@example.com')
    @user6 = User.create!(name: 'Tony', email: 'Tony@example.com')
    @up1 = UserParty.create!(viewing_party: @vp1, user: @user1, host: true)
    @up2 = UserParty.create!(viewing_party: @vp1, user: @user2, host: false)
    @up5 = UserParty.create!(viewing_party: @vp2, user: @user5, host: true)
    @up6 = UserParty.create!(viewing_party: @vp2, user: @user6, host: false)

    visit user_movies_path(@user1)
  end

  context 'discover movies button' do
    it 'has a button back to discover movies page', :vcr do
      expect(page).to have_button('Discover Movies')
      click_button 'Discover Movies'
      expect(current_path).to eq(user_discover_index_path(@user1))
    end
  end

  context 'top rated movies' do
    it 'displays the 20 highest rated movies', :vcr do
      visit user_discover_index_path(@user1)
      click_button 'Find Top Rated Movies'
      expect(current_path).to eq(user_movies_path(@user1))
      expect(page).to have_content('The Shawshank Redemption')
      expect(page).to have_content('Spirited Away')
      expect(page).to have_content('Evangelion: 3.0+1.0 Thrice Upon a Time')
    end

    it 'displays vote average of each movie', :vcr do
      visit user_discover_index_path(@user1)
      click_button 'Find Top Rated Movies'
      expect(current_path).to eq(user_movies_path(@user1))
      expect(page).to have_content('The Shawshank Redemption - (Vote Average: 8.7)')
      expect(page).to have_content("Gabriel's Inferno - (Vote Average: 8.6)")
      expect(page).to have_content('Evangelion: 3.0+1.0 Thrice Upon a Time - (Vote Average: 8.5)')
    end

    it 'each movie title is a link to that movies show page', :vcr do
      visit user_discover_index_path(@user1)
      click_button 'Find Top Rated Movies'
      expect(page).to have_link('The Shawshank Redemption')
      expect(page).to have_link('Spirited Away')
      expect(page).to have_link('Evangelion: 3.0+1.0 Thrice Upon a Time')
    end
  end

  context 'find movies form' do
    it 'returns movies based on keyword search', :vcr do
      visit user_discover_index_path(@user1)
      fill_in 'search', with: 'Avengers'
      click_button 'Find Movies'
      expect(current_path).to eq(user_movies_path(@user1))

      expect(page).to have_content('Avengers: Endgame')
      expect(page).to have_content('LEGO Marvel Avengers: Loki in Training')
    end
    it 'displays vote average for each movie', :vcr do
      visit user_discover_index_path(@user1)
      fill_in 'search', with: 'Avengers'
      click_button 'Find Movies'
      expect(current_path).to eq(user_movies_path(@user1))

      expect(page).to have_content('Avengers: Endgame - (Vote Average: 8.3)')
      expect(page).to have_content('Avengers: Age of Ultron - (Vote Average: 7.3)')
      expect(page).to have_content('LEGO Marvel Avengers: Loki in Training - (Vote Average: 7.8)')
    end
    it 'names of movies are links to movie show page', :vcr do
      visit user_discover_index_path(@user1)
      fill_in 'search', with: 'Avengers'
      click_button 'Find Movies'
      expect(current_path).to eq(user_movies_path(@user1))

      expect(page).to have_link('Avengers: Endgame')
      expect(page).to have_link('LEGO Marvel Avengers: Loki in Training')
    end
  end
end
