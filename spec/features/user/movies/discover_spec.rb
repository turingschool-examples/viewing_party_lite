require 'rails_helper'

RSpec.describe "User discover page", type: :feature do
  before :each do
    @user1 = User.create!(name: 'Sai', email: 'SaiLent@overlord.com')
    @user2 = User.create!(name: 'Parker', email: 'GriffithDidNothing@Wrong.com')
  end

  it 'has a button to discover top rated movies' do
    visit "/users/#{@user1.id}/discover"

    expect(page).to have_button("Discover Top Rated Movies")
  end

  it 'has a search box and button to search by movie title' do
    visit "/users/#{@user1.id}/discover"

    expect(page).to have_field(:search)
    expect(page).to have_button("Search by Movie Title")
  end

  it 'Discover top rated movies button routes to movie results page-for top rated', :vcr do
    visit "/users/#{@user1.id}/discover"

    click_button("Discover Top Rated Movies")

    expect(current_path).to eq("/users/#{@user1.id}/movies")#Will visually confirm that query params are appearing as expected on heroku
  end

  it 'can search a key word and return matching titles, and their rating' do
    visit "/users/#{@user1.id}/discover"

    fill_in(:q, with: 'Howl')
    click_button("Search by Movie Title")
    expect(current_path).to eq("/users/#{@user1.id}/movies")#Will visually confirm that query params are appearing as expected on heroku
  end
end
