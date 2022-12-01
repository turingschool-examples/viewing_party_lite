# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Movie Results Page' do
  describe 'As a User' do
    describe 'when I visit the discover page' do
      describe 'I see a button for top rated movies' do
        describe 'when I click this button' do
          it 'then I am taken to a page where I see top 20 movie titles as links and their vote averages', :vcr do
            user1 = create(:user)
            visit "/users/#{user1.id}/discover/"

            click_button 'Find Top Rated Movies'
            #  save_and_open_page
            expect(current_path).to eq("/users/#{user1.id}/movies")
            expect(page).to have_link('Home')
            expect(page).to have_content('Viewing Party Lite')
            expect(page).to have_content('Top Rated Movies')
            expect(page).to have_content('Vote Average: 8.7')
            expect(page).to have_link('The Godfather')
            expect(page).to have_button('Discover Page')
            expect(page).to have_content('Vote Average', count: 20)
          end
        end
      end

      describe 'When I type a keyword into search and select find movies' do
        it "I am taken to '/users/user_id/movies' and I see of movies that include that keyword", :vcr do
          user1 = create(:user)
          visit "/users/#{user1.id}/discover/"

          fill_in('Find Movies', with: 'Spinal Tap')
          click_button('Find Movies')
          #  save_and_open_page
          expect(current_path).to eq("/users/#{user1.id}/movies")
          expect(page).to have_content('Movie results for: Spinal Tap')
        end
      end

      describe 'When I do not type anything into search and select find movies' do
        it "Then I am directed to '/users/user_id/movies' where I see top rate movies", :vcr do
          user1 = create(:user)
          visit "/users/#{user1.id}/discover/"

          click_button('Find Movies')
          # save_and_open_page
          expect(current_path).to eq("/users/#{user1.id}/movies")
          expect(page).to have_content('Top Rated Movies')
        end
      end

      describe 'When on the results page' do
        describe 'When I click the button Discover Page' do
          it "Then I am redirected back to '/users/id/discover' ", :vcr do
            user1 = create(:user)
            visit "/users/#{user1.id}/movies"

            click_button('Discover Page')

            expect(current_path).to eq("/users/#{user1.id}/discover")
          end
        end
      end
    end
  end
end
