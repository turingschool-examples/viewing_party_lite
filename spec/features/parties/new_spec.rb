# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'New party page' do
  it 'When i visit the new party page has title and form', :vcr do
    user_1 = User.create!(name: 'Becky', email: 'becky@example.com')
    user_2 = User.create!(name: 'Steven', email: 'steven@example.com')
    movie_id = 22

    visit new_user_movie_viewing_party_path(user_1, movie_id)
    fill_in :duration, with: '102'
    fill_in :date, with: '3/23/2022'
    fill_in :start_time, with: '6:30'

    expect(page).to have_field('title', placeholder: 'Pirates of the Caribbean: The Curse of the Black Pearl')
    expect(page).to have_field('duration', with: 102)
    expect(page).to have_field('date')
    expect(page).to have_button('Create Party')
  end
end
