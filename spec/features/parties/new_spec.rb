# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Viewing Party Page (new)' do
  describe 'user visits the viewing party page page' do
    before :each do
      @user_1 = create(:user)
      @user_2 = create(:user)
      @user_3 = create(:user)

      movie = File.read('./spec/fixtures/fight_club.json')
      movie_data = JSON.parse(movie, symbolize_names: true)
      @fight_club = Movie.new(movie_data)

      @party_1 = create(:party, host_id: @user_1.id, duration: @fight_club.runtime)

      create(:user_parties, user_id: @user_1.id, party_id: @party_1.id)
      create(:user_parties, user_id: @user_2.id, party_id: @party_1.id)
      create(:user_parties, user_id: @user_3.id, party_id: @party_1.id)

      visit new_user_movie_party_path(@user_1, @fight_club.id)
    end

    it 'shows the name of the movie title above a form with party details to fill out' do
      expect(page).to have_content(@fight_club.original_title)
      expect(page).to have_content(@user_2.name)
      expect(page).to have_content(@user_3.name)
      fill_in :duration, with: @party_1.duration.to_s

      check(@user_2.id.to_s)
      click_button 'Create Party'

      expect(current_path).to eq("/dashboard/#{@user_1.id}")
      expect(page).to have_content(@party_1.date)
    end
  end
end
