require 'rails_helper'

RSpec.describe 'Movie Details' do
  @users = let!(:users) { create_list(:user, 3) }

  before :each do
    @user1 = users[0]
    @user2 = users[1]
    @user3 = users[2]
  end

  describe 'When I visit a movies detail page I should see' do
    it 'a button to create a viewing party', :vcr do
      @movie = MovieFacade.movie_info(244_786)

      visit "/users/#{@user1.id}/movies/#{@movie.id}"

      expect(page).to have_button('Create A Viewing Party')
      click_button 'Create A Viewing Party'

      expect(current_path).to eq("/users/#{@user1.id}/movies/#{@movie.id}/viewing-party/new")
    end

    it 'a button to return to the discover page', :vcr do
      @movie = MovieFacade.movie_info(244_786)

      visit "/users/#{@user1.id}/movies/#{@movie.id}"

      expect(page).to have_button('Discover')
      click_button 'Discover'

      expect(current_path).to eq("/users/#{@user1.id}/discover")
    end

    it 'the following information about the movie: Movie Title, Vote Average of the movie, Runtime in hours and minutes, genre(s), Summary, first 10 cast members, count of total reviews, and each reviews author and information',
       :vcr do
      @movie = MovieFacade.movie_info(244_786)

      visit "/users/#{@user1.id}/movies/#{@movie.id}"

      expect(page).to have_content(@movie.title)
      expect(page).to have_content('Runtime: 1 hour(s) and 47 minutes')
      expect(page).to have_content('Genres: Drama, Music')
      expect(page).to have_content('Summary: Under the direction of a ruthless instructor, a talented young drummer begins to pursue perfection at any cost, even his humanity.')
      expect(page).to have_content('Cast (character name in bold):')
      expect(page).to have_content('Andrew Neiman: Miles Teller')
      expect(page).to have_content('Terence Fletcher: J.K. Simmons')
      expect(page).to have_content('Jim Neiman: Paul Reiser')
      expect(page).to have_content('Nicole: Melissa Benoist')
      expect(page).to have_content('Ryan Connolly: Austin Stowell')
      expect(page).to have_content('Uncle Frank: Chris Mulkey')
      expect(page).to have_content('Carl Tanner: Nate Lang')
      expect(page).to have_content('Dustin: Charlie Ian')
      expect(page).to have_content('Travis: Jayson Blair')
      expect(page).to have_content('Sophie: Kavita Patil')
      expect(page).to have_content('Total Reviews: 5')
      expect(page).to have_content('Reviews:')

      within '#review-0' do
        expect(page).to have_content('Author: MJM')
        expect(page).to have_content('Review: DISGUSTING NONSENSE...')
        expect(page).to_not have_content('Author: Andres Gomez')
        expect(page).to_not have_content('Review: Fantastic movie with a good cast')
      end

      within '#review-1' do
        expect(page).to have_content('Author: Andres Gomez')
        expect(page).to have_content('Review: Fantastic movie with a good cast')
        expect(page).to_not have_content('Author: DanDare')
        expect(page).to_not have_content('Review: J K Simmons won an Oscar for Best Supporting Actor')
      end

      within '#review-2' do
        expect(page).to have_content('Author: DanDare')
        expect(page).to have_content('Review: J K Simmons won an Oscar for Best Supporting Actor')
        expect(page).to_not have_content('Author: Andres Gomez')
        expect(page).to_not have_content('Review: Fantastic movie with a good cast')
      end

      within '#review-3' do
        expect(page).to have_content('Author: mattwilde123')
        expect(page).to have_content("Review: When I sat down to watch this film, I didn't know what to expect.")
        expect(page).to_not have_content('Author: Andres Gomez')
        expect(page).to_not have_content('Review: Fantastic movie with a good cast')
      end

      within '#review-4' do
        expect(page).to have_content('Author: Matthew Brady')
        expect(page).to have_content('Review: "There are no two words in the English language more harmful than good job".')
        expect(page).to_not have_content('Author: Andres Gomez')
        expect(page).to_not have_content('Review: Fantastic movie with a good cast')
      end
    end
  end
end
