require 'rails_helper'

RSpec.describe 'a user discover page' do
  it 'has a button to discover top rated movies' do
    user_1 = User.create!(name: 'Buggs', email: 'buggs@bunny.com')

    visit "/users/#{user_1.id}/discover"
# save_and_open_page
    click_button "Discover Top Rated Movies"
# require "pry"; binding.pry
    expect(current_path).to eq("/users/#{user_1.id}/movies")
  end

  it 'displays a text-field and sumbit button to search by movie title' do
    user_1 = User.create!(name: 'Buggs', email: 'buggs@bunny.com')

    visit "/users/#{user_1.id}/discover"

    fill_in :q, with: 'castaway'
    click_button "Search"

    expect(current_path).to eq("/users/#{user_1.id}/movies")
  end
end
