# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Discover Index Page' do
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

    visit user_discover_index_path(@user1)
  end
  context 'it displays correctly' do
    it 'has button to top rated movies' do
      expect(page).to have_button('Find Top Rated Movies')
    end
    it 'has field to input keywords to search movie titles' do
      within '#movie_search' do
        expect(page).to have_field('search', placeholder: 'Search by movie title')
      end
    end
    it 'has a button to submit form' do
      within '#movie_search' do
        expect(page).to have_button('Find Movies')
      end
    end
  end
  context 'top rated movies button' do
    it 'routes to movies index', :vcr do
      click_button 'Find Top Rated Movies'
      expect(current_path).to eq(user_movies_path(@user1))
    end
  end
  context 'find movies form' do
    it 'routes to movies index', :vcr do
      fill_in 'search', with: 'Marvel'
      click_button 'Find Movies'
      expect(current_path).to eq(user_movies_path(@user1))
    end
  end
end
