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

  it 'displays the vote average of the movie', :vcr do
    user1 = User.create!(first_name: "David", last_name: "Lynch", email: "david-fake@test.com")

    visit "/users/#{user1.id}/movies/278"

    within "#vote-average" do
      expect(page).to have_content("Vote Average: 8.7")
    end
  end

  it 'displays the runtime of the movie in hours and minutes', :vcr do
    user1 = User.create!(first_name: "David", last_name: "Lynch", email: "david-fake@test.com")

    visit "/users/#{user1.id}/movies/278"

    within "#runtime" do
      expect(page).to have_content("Runtime: 2hr 22 min")
    end
  end

  it 'displays the genre(s) associated with the movie', :vcr do
    user1 = User.create!(first_name: "David", last_name: "Lynch", email: "david-fake@test.com")

    visit "/users/#{user1.id}/movies/278"

    within "#genres" do
      expect(page).to have_content("Drama")
      expect(page).to have_content("Crime")
    end
  end

  it 'displays the summary for the movie', :vcr do
    user1 = User.create!(first_name: "David", last_name: "Lynch", email: "david-fake@test.com")

    visit "/users/#{user1.id}/movies/278"

    within "#summary" do
      expect(page).to have_content("Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.")
    end
  end

  it 'displays the first 10 cast members and their character names', :vcr do
    user1 = User.create!(first_name: "David", last_name: "Lynch", email: "david-fake@test.com")

    visit "/users/#{user1.id}/movies/278"

    within '#cast' do
      expect(page).to have_content("Tim Robbins as Andy Dufresne")
    end
  end

  it 'displays total number of reviews', :vcr do
    user1 = User.create!(first_name: "David", last_name: "Lynch", email: "david-fake@test.com")

    visit "/users/#{user1.id}/movies/278"

    within "#review-count" do
      expect(page).to have_content("7 Reviews")
    end
  end

  it 'displays all reviews for the movie with authors', :vcr do
    user1 = User.create!(first_name: "David", last_name: "Lynch", email: "david-fake@test.com")

    visit "/users/#{user1.id}/movies/278"

    within "#review-1" do
      expect(page).to have_content("Author: elshaarawy")
      expect(page).to have_content("very good movie 9.5/10")
    end

    within "#review-2" do
      expect(page).to have_content("Author: John Chard")
      expect(page).to have_content("Some birds aren't meant to be caged")
    end
  end
end