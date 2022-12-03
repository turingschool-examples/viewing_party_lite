require 'rails_helper' 

RSpec.describe 'movie detail page', :vcr, type: :feature do
  before(:each) do
    @kenz = User.create!(name: 'Kenz', email: 'kenz_mail@gmail.com')
    @astrid = User.create!(name: 'Astrid', email: 'astrid_mail@gmail.com')
    @reba = User.create!(name: 'Reba', email: 'reba_mail@gmail.com')

    @party_1 = Party.create!(movie_id: 550, duration: 170, date: Date.new(2022,12,20), start_time: DateTime.new(2022,12,20,18,30,00))
    @party_2 = Party.create!(movie_id: 700, duration: 160, date: Date.new(2022,12,27), start_time: DateTime.new(2022,12,27,20,00,00))

    @kenz_party_1 = UserParty.create!(user_id: @kenz.id, party_id: @party_1.id, user_status: 0)
    @astrid_party_1 = UserParty.create!(user_id: @astrid.id, party_id: @party_1.id, user_status: 1)
    @astrid_party_2 = UserParty.create!(user_id: @astrid.id, party_id: @party_2.id, user_status: 0)
    @reba_party_1 = UserParty.create!(user_id: @reba.id, party_id: @party_2.id, user_status: 2)

    @movie_details = MovieService.movie_details(550)
    @movie_reviews = MovieService.movie_reviews(550)
    @movie_credits = MovieService.movie_credits(550)
    @movie = Movie.new(@movie_details, @movie_reviews, @movie_credits)

    visit user_movie_path(@reba, @movie.id)
  end

  describe 'as a user' do
    describe 'when I visit user_movie_path(user_id, movie_id)' do
      it '- shows a button to create a viewing party' do
        expect(page).to have_button('Create Viewing Party for Fight Club')
        
        click_button('Create Viewing Party for Fight Club')

        expect(current_path).to eq(new_viewing_party_path(@reba, @movie.id))
      end

      it '- shows a button to return to the discover page' do
        expect(page).to have_button('Discover Movies')
        
        click_button 'Discover Movies'

        expect(current_path).to eq(discover_path(@reba))
      end

      it '- shows the movie title' do
        expect(page).to have_content("Fight Club")
      end

      it '- shows the vote average of the movie' do
        expect(page).to have_content("Vote Average: 8.428")
      end

      it '- shows the runtime in hours & minutes' do
        expect(page).to have_content("Runtime: 2 hours 19 minutes")
      end

      it '- shows the genre(s) associated to the movie' do
        expect(page).to have_content("Genre(s): Drama, Thriller, Comedy")
      end

      it '- shows the summary description' do
        expect(page).to have_content("Movie Summary:")
        expect(page).to have_content("#{@movie.summary_description}")
      end

      it '- shows the first 10 cast members (characters & actors)' do
        expect(page).to have_content("Featured Cast:")
        expect(page).to have_content("Edward Norton playing The Narrator")
      end

      it '- shows the count of total reviews' do 
        expect(page).to have_content("Total Reviews: 7")
      end

      it '- shows each reviews author and information' do
        expect(page).to have_content("Movie Reviews:")
        expect(page).to have_content("Author: Goddard")
        expect(page).to have_content("Review: Pretty awesome movie. It shows what one crazy person can convince other crazy people to do. Everyone needs something to believe in. I recommend Jesus Christ, but they want Tyler Durden.")
      end
    end
  end
end