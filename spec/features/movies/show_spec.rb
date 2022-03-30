require 'rails_helper'

RSpec.describe 'Movie Details Page' do
  describe 'has users name, discover movie button and viewing party list' do
    describe 'has buttons' do
      before(:each) do
        @jax = User.create!(name: "Jackson", email: "j@jmail.com")

        @movie_1 = Movie.create!(api_id: 550)
        @movie_2 = Movie.create!(api_id: 600)
      end

      VCR.use_cassette('fight_club_api') do
        it 'has button to create a viewing party' do
          visit user_movie_path(@jax, @movie_1)
          expect(current_path).to eq(user_movie_path(@jax, @movie_1))

          expect(page).to have_button("Create Viewing Party for #{@movie_1.get_info.title}")
          click_on "Create Viewing Party for #{@movie_1.get_info.title}"

          expect(current_path).to eq(user_movie_viewing_party_new_path(@jax, @movie_1.api_id))
        end

        it 'has button to return to discover page' do
          visit user_movie_path(@jax, @movie_1)
          expect(current_path).to eq(user_movie_path(@jax, @movie_1))

          within "div.button" do
            expect(page).to have_button("Discover Page")
            click_on "Discover Page"
            expect(current_path).to eq(user_discover_index_path(@jax))
          end
        end

        it 'shows vote average, run time, and genre(s)' do
          visit user_movie_path(@jax, @movie_1)
          expect(current_path).to eq(user_movie_path(@jax, @movie_1))


          within "div.attributes" do
            @movie = @movie_1.get_info

            expect(page).to have_content("Vote Average: #{@movie.vote_average}")
            expect(page).to have_content("Runtime: #{@movie.hours}hr #{@movie.minutes} min")
            expect(page).to have_content("Genre(s): #{@movie.genre_list}")
          end
        end

        it 'shows summary of movie' do
          visit user_movie_path(@jax, @movie_1)
          expect(current_path).to eq(user_movie_path(@jax, @movie_1))

          within "div.summary" do
            @movie = @movie_1.get_info

            expect(page).to have_content("Summary")
            expect(page).to have_content("#{@movie.summary}")
          end
        end
      end
    end
  end
end
