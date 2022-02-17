require 'rails_helper'

RSpec.describe 'User Movie Show Page' do
  describe 'view' do
    before(:each) do
      @user_1 = User.create!(name: "David", email: "david@email.com", password: 'test', password_confirmation: 'test')
      @party_1 = @user_1.parties.create!(duration: 180, day: "December 12, 2021", start_time: "7:00 pm", movie_id: 100, user_id: @user_1.id)
    end

    it 'has a home link which takes the user back to the home page', :vcr do
      visit "/users/#{@user_1.id}/movies"
      click_link('Home')
      expect(current_path).to eq(root_path)
    end

    it 'goes back to discover page after filling in form when clicking button', :vcr do
      visit "/users/#{@user_1.id}/movies?query=top%40rated"
      top_movie = MovieFacade.top_movies.first

      expect(page).to have_link(top_movie.title)

      click_link(top_movie.title)

      expect(current_path).to eq("/users/#{@user_1.id}/movies/#{top_movie.id}")

      click_button 'Discover Page'
      expect(current_path).to eq("/users/#{@user_1.id}/discover")
    end

    it 'has a Button to create a viewing party', :vcr do
      top_movie = MovieFacade.top_movies.first
      visit "/users/#{@user_1.id}/movies/#{top_movie.id}"

      click_button "Create Viewing Party for #{top_movie.title}"

      expect(current_path).to eq("/users/#{@user_1.id}/movies/#{top_movie.id}/viewing-party/new")
    end
    it "shows review author", :vcr do
      review = MovieFacade.reviews(100)
      visit "/users/#{@user_1.id}/movies/100"

      expect(page).to have_content("Author: Andres Gomez")
      expect(page).to have_content("Far from being a good movie, with tons of flaws but already pointing to the pattern of the whole Ritchie's filmography.")
      expect(page).to have_content("3 Reviews")
      expect(page).to have_content("Vote Average: 8.2")
      expect(page).to have_content("untime: 105 minutes")
      expect(page).to have_content("Genre(s): Comedy, Crime")
      expect(page).to have_content("Summary: A card shark and his unwillingly-enlisted friends need to make a lot of cash quick after losing a sketchy poker match. To do this they decide to pull a heist on a small-time gang who happen to be operating out of the flat next door.")
      expect(page).to have_content("Cast: Jason Flemyng, Dexter Fletcher, Nick Moran, Jason Statham, Vinnie Jones, Sting, Steven Mackintosh, Nicholas Rowe, Lenny McLean, P.H. Moriarty")

    end
  end
end
