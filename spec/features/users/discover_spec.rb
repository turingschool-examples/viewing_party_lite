# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Discover page' do
  before :each do
    @user = User.create(name: 'Sunny', email: 'sunny@email.com')

    visit "/users/#{@user.id}/discover"
  end

  it 'has a button for top rated movies', :vcr do
    expect(page).to have_button('Top Rated Movies')
    click_button 'Top Rated Movies'
    expect(current_path).to eq("/users/#{@user.id}/movies")
  end

  it 'has a search field an button for searching for a movie by title' do
    expect(page).to have_content('Movie Title:')
    expect(page).to have_button('Search')
  end
end
