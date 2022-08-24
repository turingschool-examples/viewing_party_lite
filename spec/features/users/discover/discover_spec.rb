require 'rails_helper'

RSpec.describe "users discover page", type: :feature do

    it 'has a users discover page' do
       user = User.create!(first_name: "Homer", last_name: "Simpson", email:"name@test.com", created_at: Time.now, updated_at: Time.now)
       
        visit "/users/#{user.id}"

        click_button("Discover Movies")

        expect(current_path).to eq("/users/#{user.id}/discover")
        expect(page).to have_button("Discover Top Rated Movies")
    end

    it 'has a text field with a search function', :vcr do
       user = User.create!(first_name: "Homer", last_name: "Simpson", email:"name@test.com", created_at: Time.now, updated_at: Time.now)
       
        visit "/users/#{user.id}/discover"

        fill_in "search", with: "Toy Story"
        click_button("Search")

        expect(page).to have_content("Toy Story")
        
        # expect(current_path).to eq("/users/#{user.id}/movies?utf8=✓&search=Toy+Story&commit=Search&user_id=1")
    end

     it 'has a text field with a top movies function', :vcr do
        user = User.create!(first_name: "Homer", last_name: "Simpson", email:"name@test.com", created_at: Time.now, updated_at: Time.now)
       
        visit "/users/#{user.id}/discover"

        click_button("Discover Top Rated Movies")

        expect(page).to have_content("The Shawshank Redemption")

        # expect(current_path).to eq("/users/#{user.id}/movies?movies=top_movies")
    end
end