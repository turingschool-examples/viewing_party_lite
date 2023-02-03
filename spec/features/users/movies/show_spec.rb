require 'rails_helper'

RSpec.describe 'The Movie Details (Show) Page', type: :feature do
  before :each do
    stub_request(:get, "https://api.themoviedb.org/3/movie/51888/credits?api_key").
    to_return(status: 200, body: File.read("spec/fixtures/robot_chicken_credits_response.json"), headers: {})

    stub_request(:get, "https://api.themoviedb.org/3/movie/51888?api_key").
    to_return(status: 200, body: File.read("spec/fixtures/robot_chicken_response.json"), headers: {})
  
    stub_request(:get, "https://api.themoviedb.org/3/movie/51888/reviews?api_key").
    to_return(status: 200, body: File.read("spec/fixtures/citizen_kane_reviews_response.json"), headers: {})
  end

  let!(:movie1) { 51888 }
  let!(:user1) { User.create!(name: "Anthony", email: "anthony@gmail.com") }
  let!(:user2) { User.create!(name: "Thomas", email: "thomas@gmail.com") }
  let!(:user3) { User.create!(name: "Jessica", email: "jessica@gmail.com") }
  
  describe 'the page basics' do
    it 'has a button to return to Discover Page' do
      visit user_movie_path(user1, movie1)

      expect(page).to have_button("Discover Page")

      click_button("Discover Page")

      expect(current_path).to eq(user_discover_index_path(user1))

      expect(page).to have_content("#{user1.name}'s Discover Movies Page")
    end

    it 'has a button to create a viewing party' do
      visit user_movie_path(user1, movie1)

      expect(page).to have_button("Create Viewing Party")
      click_button "Create Viewing Party"

      expect(current_path).to eq(new_user_movie_party_path(user1, movie1))
    end
  end

  describe 'The Movie Information' do
    it 'will list the movie title, vote-average, and run-time information' do
      visit user_movie_path(user1, movie1)

      expect(page).to have_content("Robot Chicken: Star Wars Episode III")
      expect(page).to have_content(7.4)
      expect(page).to have_content("0 hour(s) 45 min")
      expect(page).to have_content("Genres: - Comedy - Science Fiction - Animation - TV Movie")
      expect(page).to have_content("Summary: Robot Chicken: Star Wars Episode III, directed by Chris McKay, combines the satirical sensibilities of Green and Matthew Senreich's Robot Chicken with characters of the Star Wars universe.")
    end

    it 'lists the thespians for a given movie' do
      visit user_movie_path(user1, movie1)

      within("#cast-information") do
        expect(page).to have_content("Cast Information")
        expect(page).to have_content("Joseph Cotten, as Jedediah Leland Popularity Rating: 11.3")
        expect(page).to have_content("Agnes Moorehead, as Mary Kane Popularity Rating: 10.6")
        expect(page).to have_content("Ray Collins, as Jim W. Gettys Popularity Rating: 10.2")
        expect(page).to have_content("Everett Sloane, as Mr. Bernstein Popularity Rating: 5.5")
        expect(page).to have_content("Edmund Cobb, as Inquirer Reporter (uncredited) Popularity Rating: 4.5")
        expect(page).to have_content("Bert Stevens, as Man at Madison Square Garden (uncredited) Popularity Rating: 4.3")
        expect(page).to have_content("Paul Stewart, as Raymond Popularity Rating: 4.0")
        expect(page).to have_content("Frank McLure, as (uncredited) Popularity Rating: 3.6")
        expect(page).to have_content("Walter Bacon, as City Room Employee (uncredited) Popularity Rating: 3.5")
        expect(page).to have_content("Alan Ladd, as Reporter Smoking Pipe at End (uncredited) Popularity Rating: 3.1")
      end
    end

    it "lists the review information for the movie" do
      visit user_movie_path(user1, movie1)

      within("#review-information") do
        expect(page).to have_content("Reviews")
        expect(page).to have_content("Total Review Count: 7")
        expect(page).to have_content("Author: Gurre")
        expect(page).to have_content("9.0")
        expect(page).to have_content("Content: I fondly recollect, growing up in Canada in the 70's and 80's, my mom taking my older sister and I to the cinema (my dad was more interested in watching bowling, hockey, or either crime shows, British sitcoms or hockey on TV). Despite all of his TV appearances over the years, and films he acted in to fund his own productions, the first time I was aware of Orson Welles was one of those startling and bizarrely professional yet unmistakably charismatic 'Paul Masson' wine commercials that they tend to make fun of on The Simpsons in these decades gone by.")
      end
    end
  end
end