require 'rails_helper'

RSpec.describe 'The Movie Details (Show) Page', type: :feature do
  let!(:movie1) {51888}
  let!(:user1) { User.create!(name: "Anthony", email: "anthony@gmail.com") }
  let!(:user2) { User.create!(name: "Thomas", email: "thomas@gmail.com") }
  let!(:user3) { User.create!(name: "Jessica", email: "jessica@gmail.com") }
  
  describe 'the page basics' do
    it 'has a button to return to Discover Page' do
      stub_request(:get, "https://api.themoviedb.org/3/movie/51888?api_key").
      to_return(status: 200, body: File.read("spec/fixtures/robot_chicken_response.json"), headers: {})

      visit user_movie_path(user1, movie1)

      expect(page).to have_button("Discover Page")

      click_button("Discover Page")

      expect(current_path).to eq(user_discover_index_path(user1))

      expect(page).to have_content("#{user1.name}'s Discover Movies Page")
    end

    it 'has a button to create a viewing party' do
      visit user_movie_path(user1, movie1)

      expect(page).to have_button("Create Viewing Party", new_user_movie_party_path(user1, movie1))
    end
  end

  describe 'The Movie Information' do
    it 'will list the movie title, vote-average, and run-time information' do
      stub_request(:get, "https://api.themoviedb.org/3/movie/51888?api_key").
      to_return(status: 200, body: File.read("spec/fixtures/robot_chicken_response.json"), headers: {})

      visit user_movie_path(user1, movie1)

      expect(page).to have_content("Robot Chicken: Star Wars Episode III")
      expect(page).to have_content(7.4)
      expect(page).to have_content("0 hour(s) 45 min")
      expect(page).to have_content("Genres: - Comedy - Science Fiction - Animation - TV Movie")
      expect(page).to have_content("Summary: Robot Chicken: Star Wars Episode III, directed by Chris McKay, combines the satirical sensibilities of Green and Matthew Senreich's Robot Chicken with characters of the Star Wars universe.")
    end

    it 'lists the thespians for a given movie' do
      stub_request(:get, "https://api.themoviedb.org/3/movie/51888?api_key").
      to_return(status: 200, body: File.read("spec/fixtures/robot_chicken_response.json"), headers: {})

      visit user_movie_path(user1, movie1)

      within("#cast-information") do
        expect(page).to have_content("Cast Information")
        # needs more testing here
      end
    end
  end
end