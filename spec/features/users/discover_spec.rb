require 'rails_helper'

RSpec.describe 'discover movies', type: :feature do
  it 'has the specified info' do
    user = User.create(name: "Jill Jillian", email: "jill@gmail.com")
    visit "/users/#{user.id}/discover"
    expect(page).to have_content("Discover Your Next Favorite Movie")
    expect(page).to have_button("Top Rated Movies")
    expect(page).to have_content("Search Movies by Title")
    expect(page).to have_form("Title")
    expect(page).to have_button("Search")
  end

  it 'top rated movies' do
    user = User.create(name: "Jill Jillian", email: "jill@gmail.com")
    visit "/users/#{user.id}/discover"
    click_button("Top Rated Movies")
    expect(current_path).to eq("/users/#{user.id}/movies?q=top%20rated")

  end

  it 'search results' do
    user = User.create(name: "Jill Jillian", email: "jill@gmail.com")
    visit "/users/#{user.id}/discover"
    fill_in :title, with: 'Lebowski'
    click_button 'search'
    expect(current_path).to eq("/users/#{user.id}/movies?q=lebowski")

  end


end
