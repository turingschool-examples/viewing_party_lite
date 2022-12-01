require 'rails_helper'

RSpec.describe 'Movies Index Page' do
  describe 'As a user when I visit users/:id/discover' do 
    describe 'and you click the find top rated movies button' do 
      it 'takes you to the top rated movies index page', :vcr do 
        user1 = User.create!(name: 'Amanda', email: 'amanda@turing.edu')
        
        visit "/users/#{user1.id}/discover"
        click_button 'Discover The Top Rated Movies'
        expect(current_path).to eq("/users/#{user1.id}/movies")
        expect(page).to have_content('The Godfather Vote Average:8.7')
        expect(page).to have_content('Dilwale Dulhania Le Jayenge Vote Average:8.6')
        expect(page).to have_content('Dou kyu sei – Classmates Vote Average:8.5')
      end
    end

    describe 'and you fill in the search field and click on find movies' do 
      it 'takes you to the movie from title keywords search', :vcr do
        user1 = User.create!(name: 'Amanda', email: 'amanda@turing.edu')
        visit "/users/#{user1.id}/discover"
        expect(page).to have_field("q")
        fill_in(:q, with: "Princess space")
        click_button "Find Movies"
        expect(current_path).to eq("/users/#{user1.id}/movies")
        expect(page).to have_content('Space Princess')
        expect(page).to have_content("Crayon Shin-chan: Invoke a Storm! Me and the Space Princess")
      end

      it 'has links to all the movies show pages', :vcr do 
        user1 = User.create!(name: 'Amanda', email: 'amanda@turing.edu')
        visit "/users/#{user1.id}/discover"
        fill_in(:q, with: "Princess space")
        click_button "Find Movies"

        expect(page).to have_link('Space Princess', href: user_movie_path(user1, 651812))
        expect(page).to have_link('Crayon Shin-chan: Invoke a Storm! Me and the Space Princess', href: user_movie_path(user1, 163772))
        expect(page).to have_link("My Brother's Wife 4 - Space Princess Choon-hyang", href: user_movie_path(user1, 700972))
        expect(page).to have_link("My Brother's Wife 4 - Space Princess Choon Hyang", href: user_movie_path(user1, 930411))
      end
    end
  end
end