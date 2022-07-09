require 'rails_helper'

RSpec.describe 'Discover' do
  it 'has a button to display top rated movies' do
    user = User.create!(name: 'User', email: 'user@email.com')

    visit "user/#{user.id}/discover"

    expect(page).to have_button("Discover Top Rated Movies")

    click_button "Discover Top Rated Movies"
    expect(current_path).to eq("/users/#{user.id}/movies")
  end

  it 'has a field to search for a movies' do
    user = User.create!(name: 'User', email: 'user@email.com')

    visit "user/#{user.id}/discover"

    fill_in 'search', with: 'Star Wars'
    click_on 'Search'
    expect(current_path).to eq("/users/#{user.id}/movies")

  end
end