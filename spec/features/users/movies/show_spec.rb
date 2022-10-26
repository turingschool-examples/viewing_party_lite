require 'rails_helper'

RSpec.describe 'the movies detail page' do
  let!(:user) { create :user }

  before :each do
    VCR.use_cassette('minion-details') do
      visit login_path
        
      fill_in 'Email', with: "#{user.email}"
      fill_in 'Password', with: "#{user.password}"
  
      click_button 'Log In'

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      @movie = MoviesFacade.details(438_148)
      visit "/dashboard/movies/#{@movie.id}"
    end
  end

  describe 'When I visit a movies detail page' do
    VCR.use_cassette('minion-details') do
      it 'displays a button to create a viewing party and a button to return to the discover page' do
        expect(page).to have_button("Create a Viewing Party for #{@movie.title}")
        expect(page).to have_button('Back to Discover Page')
      end

      describe 'when I click on the button to create a viewing party' do
        it 'takes me to the new viewing party page', :vcr do
          click_on "Create a Viewing Party for #{@movie.title}"

          expect(current_path).to eq("/dashboard/movies/#{@movie.id}/viewing_parties/new")
        end
      end

      describe 'when I click the button to return to the discover page' do
        it 'returns to discover page' do
          click_on 'Back to Discover Page'

          expect(current_path).to eq(dashboard_discover_path)
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
end
