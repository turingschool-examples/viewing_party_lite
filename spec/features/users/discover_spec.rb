# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user discover movies page', :vcr do
  it 'has a button to find top rated movies' do
    user_1 = User.create!(name: 'ODB', email: 'testemail3@mail.com', password: 'test123')
    visit "/users/#{user_1.id}/discover"
    click_on('Find Top Rated Movies')
    expect(current_path).to eq("/users/#{user_1.id}/movies")
  end

  it 'has a button to search for a particular movie' do
    user_1 = User.create!(name: 'ODB', email: 'testemail3@mail.com', password: 'test123')
    visit "/users/#{user_1.id}/discover"
    fill_in :search, with: 'Phoenix'
    click_button 'Search'
    expect(current_path).to eq("/users/#{user_1.id}/movies")
  end

  it 'can show a warning if a movie is unavailable' do
    user_1 = User.create!(name: 'ODB', email: 'testemail3@mail.com', password: 'test123')
    visit "/users/#{user_1.id}/discover"
    fill_in :search, with: 'AJKJSJKSKJSKJ:KJ:KJSDFKJDF!'
    click_button 'Search'
    expect(page).to have_content('No results found!')
    expect(current_path).to eq("/users/#{user_1.id}/discover")
  end
end
