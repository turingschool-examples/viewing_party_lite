# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user discover page' do
  before(:each) do
    @user = create(:user)

    visit "/users/#{@user.id}/discover"
  end

  it 'has a heading of discover movies' do
    expect(page).to have_content("Discover Movies")
  end

  it 'has a link to show top 40 movies' do
    click_button("Find Top Rated Movies")
    expect(current_path).to eq("/users/#{@user.id}/movies")
    expect(page).to have_content("Forrest Gump")
  end

  it 'can search for specific movies' do
    fill_in 'find_movie', with: "Into the Spiderverse"
    click_button("Find Movies")
    expect(current_path).to eq("/users/#{@user.id}/movies")
    expect(page).to have_content("Spider-Man")
  end

  it 'redirects if no valid argument given in searches' do
    visit "/users/#{@user.id}/movies"
    expect(current_path).to eq("/users/#{@user.id}/discover")
    expect(page).to have_content("Please search for movies or browse the top 40 movies")
  end
end
