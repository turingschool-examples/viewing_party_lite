require 'rails_helper'

RSpec.describe "users discover page", type: :feature do

    it 'has a users discover page' do
       user = User.create!(first_name: "Homer", last_name: "Simpson", email:"name@test.com", created_at: Time.now, updated_at: Time.now)
       
        visit "/users/#{user.id}"

        click_button("Discover Movies")

        expect(current_path).to eq("/users/#{user.id}/discover")
        expect(page).to have_button("Discover Top Rated Movies")
    end

    it 'has a text field with a search function' do
       user = User.create!(first_name: "Homer", last_name: "Simpson", email:"name@test.com", created_at: Time.now, updated_at: Time.now)
       
        visit "/users/#{user.id}/discover"

        fill_in "search", with: "Toy Story"
        click_button("Search")

        expect(current_path).to eq("/users/#{user.id}/movies?=toy_story")
    end

     xit 'has a text field with a top movies function' do
        user = User.create!(first_name: "Homer", last_name: "Simpson", email:"name@test.com", created_at: Time.now, updated_at: Time.now)
       
        visit "/users/#{user.id}/discover"

        click_button("Discover Top Rated Movies")

        expect(current_path).to eq("/users/#{user.id}/movies?=top%20rated")
    end
end