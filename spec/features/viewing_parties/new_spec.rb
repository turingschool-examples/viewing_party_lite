require 'rails_helper'

RSpec.describe 'New Viewing Party' do
  @users = let!(:users) { create_list(:user, 3) }
  before :each do 
    @user1 = users[0]
    @user2 = users[1]
    @user3 = users[2]
  end

  describe 'When I visit the new viewing party page' do
    describe 'I should see the name of the movie title rendered above a form with the following fields' do
      it 'duration of a party with a default value of movie runtime in minutes', :vcr do
        movie = MovieFacade.movie_info(244786)
        visit "/users/#{@user1.id}/movies/#{movie.id}/viewing-party/new"

        expect(page).to have_field('Duration (in minutes):', with: "107" )        
      end

      it 'When: field to select date', :vcr do
        movie = MovieFacade.movie_info(244786)
        visit "/users/#{@user1.id}/movies/#{movie.id}/viewing-party/new"

        expect(page).to have_field('When:')
      end

      it 'Start Time: field to select time', :vcr do
        movie = MovieFacade.movie_info(244786)
        visit "/users/#{@user1.id}/movies/#{movie.id}/viewing-party/new"

        expect(page).to have_field('Start Time:')
      end

      it 'Checkboxes next to each existing user in the system', :vcr do
        movie = MovieFacade.movie_info(244786)
        visit "/users/#{@user1.id}/movies/#{movie.id}/viewing-party/new"
        
        within "#user-#{@user2.id}" do
          check "invited_user_#{@user2.id}"
          uncheck "invited_user_#{@user2.id}"
          expect(page).to have_content(@user2.name)
        end

        within "#user-#{@user3.id}" do
          check "invited_user_#{@user3.id}"
          uncheck "invited_user_#{@user3.id}"
          expect(page).to have_content(@user3.name)
        end
      end

      it 'button to create a party', :vcr do
        movie = MovieFacade.movie_info(244786)
        visit "/users/#{@user1.id}/movies/#{movie.id}/viewing-party/new"

        expect(page).to have_button('Create Viewing Party')
      end

      it 'will redirect me back to the user dashboard where the new viewing party is shown', :vcr do
        movie = MovieFacade.movie_info(244786)
        visit "/users/#{@user1.id}/movies/#{movie.id}/viewing-party/new"

        fill_in "Duration (in minutes):", with: "55"
        fill_in "When:", with: "09/22/2022"
        fill_in "Start Time:", with: "08:00pm"
        check "invited_user_#{@user2.id}"
        click_button "Create Viewing Party"

        expect(current_path).to eq("/users/#{@user1.id}/movies/#{movie.id}/viewing-party/new")
        expect(page).to have_content("Error: Duration of the viewing party must be longer than the movie's runtime.")

        fill_in "Duration (in minutes):", with: "125"
        fill_in "When:", with: "09/22/2022"
        fill_in "Start Time:", with: "08:00pm"
        check "invited_user_#{@user2.id}"
        click_button "Create Viewing Party"

        expect(current_path).to eq("/users/#{@user1.id}")
        expect(page).to have_content(movie.title)
        
        visit "/users/#{@user2.id}"

        expect(page).to have_content(movie.title)

        visit "/users/#{@user3.id}"

        expect(page).to_not have_content(movie.title)
      end
    end
  end
end