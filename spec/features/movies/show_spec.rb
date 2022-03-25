require 'rails_helper'

RSpec.describe 'Movie Details Page' do
  describe 'has users name, discover movie button and viewing party list' do
    describe 'has buttons' do
      before(:each) do
        @jax = User.create!(name: "Jackson", email: "j@jmail.com")

        @movie_1 = Movie.create!(api_id: 550)
        @movie_2 = Movie.create!(api_id: 600)
      end

      it 'has button to create a viewing party' do
        visit user_movie_path(@jax.id, @movie_1.id)
        expect(current_path).to eq(user_movie_path(@jax, @movie_1))

        VCR.use_cassette('fight_club_api') do
          expect(page).to have_button("Create Viewing Party for #{@movie_1.get_info.title}")
          click_on "Create Viewing Party for #{@movie_1.get_info.title}"
          expect(current_path).to eq(user_movie_viewing_party_new_path(@jax, @movie_1))
        end
      end

      it 'has button to return to discover page' do
        visit user_movie_path(@jax, @movie_1)
        expect(current_path).to eq(user_movie_path(@jax, @movie_1))

        VCR.use_cassette('fight_club_api') do
          within "div.button" do
            expect(page).to have_button("Discover Page")
            click_on "Discover Page"
            expect(current_path).to eq(user_discover_index_path(@jax))
          end
        end
      end

      it 'shows vote average, run time, and genre(s)' do
        visit user_movie_path(@jax, @movie_1)
        expect(current_path).to eq(user_movie_path(@jax, @movie_1))

        VCR.use_cassette('fight_club_api') do
          within "div.attributes" do
            expect(page).to have_content("Vote Average: #{@movie_1.vote_average}")
            expect(page).to have_content("Runtime: #{@movie.hours}hr #{@movie.minutes} min")
            expect(page).to have_content("Genre(s): Drama")
          end
        end

      it 'shows summary of movie' do
        visit user_movie_path(@jax, @movie_1)
        expect(current_path).to eq(user_movie_path(@jax, @movie_1))

        VCR.use_cassette('fight_club_api') do
          within "div.attributes" do
            expect(page).to have_content("Vote Average: #{@movie_1.vote_average}")
            expect(page).to have_content("Runtime: #{@movie.hours}hr #{@movie.minutes} min")
            expect(page).to have_content("Genre(s): Drama")
          end
        end
      end
    end
  end
end
