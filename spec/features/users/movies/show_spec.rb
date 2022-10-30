require 'rails_helper'

RSpec.describe 'the movies detail page' do
  describe 'As a logged in user, when I visit a movies detail page' do
    let!(:user) { create :user }

    before :each do
      VCR.use_cassette('minion-details') do
        visit login_path
          
        fill_in 'Email', with: "#{user.email}"
        fill_in 'Password', with: "#{user.password}"
    
        click_button 'Log In'

        @movie = MoviesFacade.details(438_148)
        visit movie_path(@movie.id)
        save_and_open_page
      end
    end

    VCR.use_cassette('minion-details') do
      it 'displays a button to create a viewing party and a button to return to the discover page' do
        expect(page).to have_button("Create a Viewing Party for #{@movie.title}")
        expect(page).to have_button('Back to Discover Page')
      end

      describe 'when I click on the button to create a viewing party' do
        it 'takes me to the new viewing party page', :vcr do
          click_on "Create a Viewing Party for #{@movie.title}"

          expect(current_path).to eq(new_movie_viewing_party_path(@movie.id))
        end
      end

      describe 'when I click the button to return to the discover page' do
        it 'returns to discover page' do
          click_on 'Back to Discover Page'

          expect(current_path).to eq(discover_path)
        end
      end

      it 'displays movie title/vote average/runtime/genre/summary/10 cast members/count of reviews/reviews author and information' do
        expect(page).to have_content(@movie.title.to_s)
        expect(page).to have_content(@movie.vote_average.to_s)
        expect(page).to have_content(@movie.hours_and_minutes.to_s)
        expect(page).to have_content(@movie.summary.to_s)
        expect(page).to have_content(@movie.reviews.count.to_s)

        @movie.genres.each do |genre|
          expect(page).to have_content(genre)
        end

        @movie.cast.each do |member|
          expect(page).to have_content(member)
        end

        @movie.reviews.each do |review|
          expect(page).to have_content(review[:author])
        end
      end
    end
  end

  describe 'As a visitor if I go to a movies show page' do
    let!(:user) { create :user }

    before :each do
      VCR.use_cassette('minion-details') do
        @movie = MoviesFacade.details(438_148)
        visit movie_path(@movie.id)
      end
    end

    it 'does not allow access to a new viewing party without first logging in' do
      click_on "Create a Viewing Party for #{@movie.title}"

      expect(current_path).to eq(root_path)
      expect(page).to have_content('You must be logged in to access this page')
    end
  end
end
