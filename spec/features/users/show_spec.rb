# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user dashboard (show) page' do
  before(:each) do
    @user = create(:user)
    visit "/users/#{@user.id}"
  end

  it "shows dashboard name as user name's dashboard" do
    expect(page).to have_content("#{@user.name}'s Dashboard")
  end

  it 'has a button to discover movies' do
    within('div#discover_movies') do
      expect(page).to have_button("Discover Movies")

      # click_button("Discover Movies")

      # expect(page).to have_content(movie1)
      # expect(page).to have_content(movie2)
    end
  end

  it 'has a section that lists viewing parties' do
    within('div#viewing_parties') do
      expect(page).to have_content("Viewing Parties")
      # expect(page).to have_content(@party1.name)
      # expect(page).to_not have_content(@party2.name)
      # expect(page).to have_content(@party3.name)
    end
  end
end

# When I visit '/users/:id' where :id is a valid user id,
# I should see:
#
#  "<user's name>'s Dashboard" at the top of the page
#  A button to Discover Movies*
#  A section that lists viewing parties**
