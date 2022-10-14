require 'rails_helper'

RSpec.describe 'movie details page' do
  # When I visit a movie's detail page (/users/:user_id/movies/:movie_id where :id is a valid user id,
  # I should see
  
  # Button to create a viewing party
  # Button to return to the Discover Page
  # Details This viewing party button should take the user to the new viewing party page (/users/:user_id/movies/:movie_id/viewing-party/new)
  
  # And I should see the following information about the movie:
  
  # Movie Title
  # Vote Average of the movie
  # Runtime in hours & minutes
  # Genre(s) associated to movie
  # Summary description
  # List the first 10 cast members (characters&actress/actors)
  # Count of total reviews
  # Each review's author and information
  
  describe 'when I go to movie details page', :vcr => {:record => :new_episodes} do
    before :each do
      @user1 = create(:user)
      @user2 = create(:user)

      @movie1 = MovieFacade.details_poro(550)
      @movie1_credits = MovieFacade.credits_poro(550)
      @movie1_reviews = MovieFacade.reviews_poro(550)
      @movie2 = MovieFacade.details_poro(290859)
      @movie2_credits = MovieFacade.credits_poro(290859)
      @movie2_reviews = MovieFacade.reviews_poro(290859)
    end
    it 'I see button to create viewing party' do
      visit user_movie_path(@user1, @movie1.id)

      click_button "Create Viewing Party"
      expect(current_path).to eq(new_user_movie_viewing_party_path(@user1, @movie1.id))

      visit user_movie_path(@user1, @movie2.id)

      click_button "Create Viewing Party"
      expect(current_path).to eq(new_user_movie_viewing_party_path(@user1, @movie2.id))

      visit user_movie_path(@user2, @movie1.id)

      click_button "Create Viewing Party"
      expect(current_path).to eq(new_user_movie_viewing_party_path(@user2, @movie1.id))

      visit user_movie_path(@user2, @movie2.id)

      click_button "Create Viewing Party"
      expect(current_path).to eq(new_user_movie_viewing_party_path(@user2, @movie2.id))
    end

    it 'I see button to return to discover page' do
      visit user_movie_path(@user1, @movie1.id)

      click_button "Return to Discover Page"

      expect(current_path).to eq(user_discover_path(@user1.id))

      visit user_movie_path(@user2, @movie1.id)

      click_button "Return to Discover Page"

      expect(current_path).to eq(user_discover_path(@user2.id))
    end

    it 'has movie details' do
      visit user_movie_path(@user1, @movie1.id)

      within "#movie-details" do
        expect(page).to have_content(@movie1.title)
        expect(page).to have_content(@movie1.summary)
        expect(page).to have_content(@movie1.vote_average)
        expect(page).to have_content("#{@movie1.runtime / 60}H #{@movie1.runtime % 60}M")
      end

      visit user_movie_path(@user1, @movie2.id)

      within "#movie-details" do
        expect(page).to have_content(@movie2.title)
        expect(page).to have_content(@movie2.summary)
        expect(page).to have_content(@movie2.vote_average)
        expect(page).to have_content("#{@movie2.runtime / 60}H #{@movie2.runtime % 60}M")
      end
    end

    describe 'movie cast info', :vcr => {:record => :new_episodes} do
      it 'shows 10 cast members' do
        visit user_movie_path(@user1, @movie1.id)

        within "#movie-cast" do
          @movie1_credits.each do |cast_member|
            expect(page).to have_content(cast_member.name)
          end
        end

        visit user_movie_path(@user1, @movie2.id)

        within "#movie-cast" do
          @movie2_credits.each do |cast_member|
            expect(page).to have_content(cast_member.name)
          end
        end
      end
    end

    describe 'movie review', :vcr => {:record => :new_episodes} do
      it 'shows review authors and content' do
        visit user_movie_path(@user1, @movie1.id)
        
        within "#movie-reviews" do
          @movie1_reviews.each do |review|
            expect(page).to have_content(review.author)
            expect(page).to have_content(review.content[0..10])
          end
        end

        visit user_movie_path(@user1, @movie2.id)

        within "#movie-reviews" do
          @movie2_reviews.each do |review|
            expect(page).to have_content(review.author)
            expect(page).to have_content(review.content[0..10])
          end
        end
      end
    end
  end
end