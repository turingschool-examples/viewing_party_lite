# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'The User Show Page', type: :feature do
  let!(:user_1) { create(:user) }
  let!(:view_party_1) { create(:view_party, movie_id: 550, movie_name: 'Fight Club') }
  let!(:view_party_2) { create(:view_party, movie_id: 390, movie_name: 'Lisbon Story') }
  let!(:user_1_party_1) { create(:user_view_party, user: user_1, view_party: view_party_1) }
  let!(:user_1_party_2) { create(:user_view_party, user: user_1, view_party: view_party_2) }

  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)
    VCR.insert_cassette 'image url'
    visit dashboard_path
  end

  after do
    VCR.eject_cassette
  end

  describe 'When I visit the user_path', :vcr do
    it "I see a <users name>'s Dashboard at the top" do
      within '#title' do
        expect(page).to have_content("#{user_1.name}'s Dashboard")
      end
    end

    it 'I see a section that lists viewing parties' do
      within '#cards' do
        within "##{view_party_1.movie_id}" do
          expect(page).to have_content(view_party_1.movie_name)
          expect(page).to have_content(view_party_1.datetime.strftime('%A, %d %B %Y'))
          expect(page).to have_text(view_party_1.datetime.strftime('%l:%M %P'))
          if user_1_party_1.host
            expect(page).to have_content('Hosting')
          else
            expect(page).to have_content('Invited')
          end
        end
      end
    end

    it 'I see a button to "Discover Movies"' do
      within '#discover_movies_button' do
        expect(page).to have_button('Discover Movies')
      end
    end

    describe 'When I click the "Discover Movies" button' do
      it 'I am taken to the discover page' do
        within '#discover_movies_button' do
          click_button('Discover Movies')
          expect(page).to have_current_path('/discover', ignore_query: true)
        end
      end
    end
  end
end
