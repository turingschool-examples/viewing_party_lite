# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Movie Results Page' do
  it 'Shows top 20 movies', :vcr do
    @user1 = User.create!(name: 'Jimar', email: 'jimar@jimar.com', password: 'Isuck', password_confirmation: 'Isuck')

    visit "/users/#{@user1.id}/discover"

    click_button 'Top Rated Movies'
    expect(current_path).to eq("/users/#{@user1.id}/movies")

    expect(page).to have_content('Movies:')
    expect(page).to have_content('Title: The Shawshank Redemption')
    expect(page).to have_content('Average Vote: 8.7')

    expect(page).to have_link('The Shawshank Redemption')

    expect(page).to_not have_content('Title: Ariel')
    expect(page).to_not have_content('Average Vote: 6.8')
  end

  it 'can search for a movie', :vcr do
    @user1 = User.create!(name: 'Jimar', email: 'jimar@jimar.com', password: 'Isuck', password_confirmation: 'Isuck')

    visit "/users/#{@user1.id}/discover"

    fill_in('search', with: 'Fight Club')
    click_button 'Search for Movie'

    expect(current_path).to eq("/users/#{@user1.id}/movies")

    expect(page).to have_content('Title: Fight Club')
    expect(page).to have_content('Average Vote: 8.4')
  end

  it 'has a button to return to discover page', :vcr do
    @user1 = User.create!(name: 'Jimar', email: 'jimar@jimar.com', password: 'Isuck', password_confirmation: 'Isuck')

    visit "/users/#{@user1.id}/movies"

    click_button('Discover Page')

    expect(current_path).to eq("/users/#{@user1.id}/discover")
  end
end
