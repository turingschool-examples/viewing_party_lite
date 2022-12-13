# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'the user dashboard' do
  before(:each) do
    @user = create(:user)
    @invitee1 = create(:user)
    @invitee2 = create(:user)
    @invitee3 = create(:user)

    @party1 = create(:movie_party)
    @party3 = create(:movie_party)

    @ump1 = UserMovieParty.create!(user_id: @user.id, movie_party_id: @party1.id, status: 0)
    @ump2 = UserMovieParty.create!(user_id: @invitee1.id, movie_party_id: @party1.id, status: 1)
    @ump3 = UserMovieParty.create!(user_id: @invitee2.id, movie_party_id: @party1.id, status: 1)

    VCR.use_cassette('godfather_movie') do
      @image_path = MoviesFacade.movie_poster_url(@party1.movie_id)
    end
  end

  describe 'authorization' do
    before(:each) do
      VCR.use_cassette('godfather_movie') do
        visit '/dashboard'
      end
    end

    it 'redirects to landing page with error if not logged in' do 
      expect(current_path).to eq('/')
      expect(page).to have_content('Error: You must be logged in to visit dashboard')
    end
  end

  describe 'sections' do
    before(:each) do 
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      VCR.use_cassette('godfather_movie') do
        visit '/dashboard'
      end
    end

    it 'shows "user names dashboard" at top of page' do
      expect(page).to have_content("#{@user.name}'s Dashboard")
    end

    it 'has a button to discover movies' do
      expect(page).to have_button('Discover Movies')
      click_button 'Discover Movies'
      expect(current_path).to eq("/discover")
    end

    it 'lists viewing parties that user is associated with' do
      within "#party-#{@party1.id}" do
        expect(page).to have_content(@party1.movie_title)
        expect(page).to have_content(@party1.start_time.strftime('%B %d, %Y - %I:%M %p'))
        expect(page).to have_content(@ump1.status.capitalize)
      end

      expect(page).to_not have_content(@party3.movie_title)
    end

    it 'lists invitees of each viewing party' do
      within "#party-#{@party1.id}" do
        expect(page).to have_content(@invitee1.name)
        expect(page).to have_content(@invitee2.name)
        expect(page).to_not have_content(@invitee3.name)
      end
    end

    it 'has an image for each movie' do
      expect(page.body).to include(@image_path)
    end
  end
end
