# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'The Show Page', type: :feature do # rubocop:disable Metrics/BlockLength
  let!(:user_1) { create(:user) }
  let!(:view_party_1) { create(:view_party, movie_id: 550, movie_name: "Fight Club") }
  let!(:view_party_2) { create(:view_party, movie_id: 390, movie_name: "Lisbon Story") }
  let!(:user_1_party_1) { create(:user_view_party, user: user_1, view_party: view_party_1) }
  let!(:user_1_party_2) { create(:user_view_party, user: user_1, view_party: view_party_2) }
  before(:each) do
    VCR.insert_cassette "image url"
    visit user_path(user_1)
  end
  after(:each) do
    VCR.eject_cassette
  end

  describe 'When I visit the user show path' do
    it "I see a <users name>'s Dashboard at the top" do
      within '#header' do
        expect(page).to have_content("#{user_1.name}'s Dashboard")
      end
    end

    it 'I see a section that lists viewing parties' do
      within "##{view_party_1.movie_id}" do
        expect(page).to have_content(view_party_1.movie_name)
        expect(page).to have_content(view_party_1.datetime.strftime("%A, %d %B %Y"))
        expect(page).to have_content(view_party_1.datetime.strftime("%l:%M %P"))
        if user_1_party_1.host
          expect(page).to have_content("Hoasting")
        else
          expect(page).to have_content("Invited")
        end
      end
    end

    it 'I see a button to "Discover Movies"' do
      within '#header' do
        expect(page).to have_button("Discover Movies")
      end
    end

    describe 'When I click the "Discover Movies" button' do
      it 'I am taken to the discover page' do
        within '#header' do
          click_button("Discover Movies")
          expect(current_path).to eq("/users/#{user_1.id}/discover")
        end
      end
    end
  end
end
