# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Discover Movie', type: :feature do
  it 'has a button to discover top rated movies', :vcr do
    @user1 = User.create!(name: 'Micheal Jordan', email: 'user1@gmail.com')

    visit "/users/#{@user1.id}/discover"
    expect(page).to have_button('Discover Top Rated Movies')

    # click_button "Discover Top Rated Movies"
    # expect(current_path).to eq(user_movies_path )
    # expect(page).to have_content("Search")
  end
end
