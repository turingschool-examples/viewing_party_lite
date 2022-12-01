# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'New View Party Page', type: :feature do
  let!(:user_1) { create(:user) }
  let!(:user_2) { create(:user) }
  let!(:user_3) { create(:user) }

  let!(:movie_1) do
    Movie.new(id: 550, title: 'Fight Club', vote_average: 5.3, overview: 'hahaha', runtime: 330, genres: 'romance')
  end

  before(:each) do
    VCR.insert_cassette 'view party'
    visit new_user_movie_view_party_path(user_1, movie_1.id)
  end
  after(:each) do
    VCR.eject_cassette
  end
  describe 'When I visit the new viewing party page' do
    it 'I should see the name of the movie title rendered above a form and a button to the discover page' do
      within '#header' do
        expect(page).to have_content("Create a Movie Party for #{movie_1.title}")
        click_button 'Discover Page'
      end

      expect(current_path).to eq("/users/#{user_1.id}/discover")
    end

    xit 'the form should include the following fields: name, duration, when, start time, checkboxes next to each existing user in the system, after submitting I should be taken back to my dashboard where I see the new event' do
      within '#form' do
        fill_in :duration, with: 400
        fill_in :datetime, with: '2023-02-02 01:00:00 UTC '
        check user_2.id.to_s

        click_button 'Create Party'
      end

      expect(current_path).to eq(user_path(user_1))

      recent_view_party = ViewParty.last
      within "##{recent_view_party.movie_id}" do
        expect(page).to have_content(view_party_1.movie_name)
        expect(page).to have_content(view_party_1.datetime.strftime('%A, %d %B %Y'))
        expect(page).to have_content('Hosting')
      end
    end

    xit 'the duration in the form cannot be set to a value less than the duration of the movie' do
      within '#form' do
        fill_in :duration, with: 1
        fill_in :datetime, with: '2023-02-02 01:00:00 UTC '

        click_button 'Create Party'
      end

      expect(current_path).to eq(new_user_movie_view_party_path(user_1, movie_1.id))
      expect(page).to have_content('Party duration cannot be shorter than the movie duration')
    end

    xit 'the new view party should also show on dashboards of users that were invited' do
    end
  end
end
