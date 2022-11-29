# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'The Show Page', type: :feature do # rubocop:disable Metrics/BlockLength
  let!(:user_1) { create(:user) }
  let!(:view_party_1) { create(:view_party, movie_id: 550) }
  let!(:view_party_2) { create(:view_party, movie_id: 390) }
  before(:each) do
    create(:user_view_party, user: user_1, view_party: view_party_1)
    create(:user_view_party, user: user_1, view_party: view_party_2)
    visit user_path(user_1)
  end

  describe 'When I visit the user show path' do
    xit 'I see a <users name> Dashboard at the top' do
        expect(page).to have_content("#{user_1.name}'s Dashboard")
    end

    xit 'I see a section that lists viewing parties' do

    end

    xit 'I see a button to "Discover Movies"' do

    end

    describe 'When I click the "Discover Movies" button' do
      xit 'I am taken to the discover page' do

      end
    end
  end
end
