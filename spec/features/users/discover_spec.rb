# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Discover Page' do
  it 'discover button' do
    @user1 = User.create!(name: 'Jimar', email: 'jimar@jimar.com')
    @user2 = User.create!(name: 'NickT', email: 'NickT@jimar.com')

    visit user_path(@user1.id)


    click_button "Discover Movies"
    expect(current_path).to eq("/users/#{@user1.id}/discover")
  end

  it 'tells details the user discover page' do
    @user1 = User.create!(name: 'Jimar', email: 'jimar@jimar.com')

    visit "/users/#{@user1.id}/discover"
    expect(page).to have_button("Top Rated Movies")

  end

  it 'tells details the user discover page', :vcr do
    @user1 = User.create!(name: 'Jimar', email: 'jimar@jimar.com')

    visit "/users/#{@user1.id}/discover"

    click_button "Top Rated Movies"
    expect(current_path).to eq("/users/#{@user1.id}/movies")

    expect(page).to have_content("Top 20 Movies:")
    expect(page).to have_content("Title: The Shawshank Redemption")
    expect(page).to have_content("Average Vote: 8.7")

    expect(page).to_not have_content("Title: Ariel")
    expect(page).to_not have_content("Average Vote: 6.8")



  end

  it 'tells details a search param', :vcr do
    @user1 = User.create!(name: 'Jimar', email: 'jimar@jimar.com')

    visit "/users/#{@user1.id}/discover"

    # click_button "Top Rated Movies"
    # expect(current_path).to eq("/users/#{@user1.id}/movies")
    #
    # expect(page).to have_content("Top 20 Movies:")
    # expect(page).to have_content("Title: The Shawshank Redemption")
    # expect(page).to have_content("Average Vote: 8.7")
    #
    # expect(page).to_not have_content("Title: Ariel")
    # expect(page).to_not have_content("Average Vote: 6.8")



  end



end
