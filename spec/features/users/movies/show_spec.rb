require 'rails_helper'

RSpec.describe 'Movie details page' do 
    context 'When I visit a movies detail page, where :id is a valid user id' do
        before :each do 
            @user1 = User.create!(name: 'Jared', email: 'jared@example.com', password: "password",)
            @movie_id = 199
            visit "/users/#{@user1.id}/movies/#{@movie_id}"
        end

        it 'I should see a button to create a viewing party
        that takes me to the new viewing party page' do 
            expect(current_path).to eq("/users/#{@user1.id}/movies/#{@movie_id}")
            expect(page).to have_button("Create a Viewing Party")
            click_button("Create a Viewing Party")
            expect(current_path).to eq("/users/#{@user1.id}/movies/#{@movie_id}/viewing-party/new")
        end

        it 'I should see a button to return to the Discover page' do 
            expect(page).to have_button('Return to Discover Page')

        end

    end
end