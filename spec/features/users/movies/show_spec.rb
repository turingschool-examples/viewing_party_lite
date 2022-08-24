require 'rails_helper'

RSpec.describe "movie detail page", type: :feature do
  
  it 'has a button to create a viewing party', :vcr do
    user1 = User.create!(first_name: "David", last_name: "Lynch", email: "david-fake@test.com")

    visit "/users/#{user1.id}/movies/278"

    click_button("Create Viewing Party for The Shawshank Redemption")

    expect(current_path).to eq("/users/#{user1.id}/movies/278/viewing-party/new")
  end

  it 'has a button to return to the discover page', :vcr do
    user1 = User.create!(first_name: "David", last_name: "Lynch", email: "david-fake@test.com")

    visit "/users/#{user1.id}/movies/278"

    click_button("Discover Page")

    expect(current_path).to eq("/users/#{user1.id}/discover")
  end

  it 'displays the movie title', :vcr do
    user1 = User.create!(first_name: "David", last_name: "Lynch", email: "david-fake@test.com")

    visit "/users/#{user1.id}/movies/278"

    within "#movie-title" do
      expect(page).to have_content("The Shawshank Redemption")
    end
  end

end