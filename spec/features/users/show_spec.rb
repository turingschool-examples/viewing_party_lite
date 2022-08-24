require 'rails_helper'


RSpec.describe 'user dashboard(show)' do 

    it "can render a particular user's show page" do

        user_1 = User.create!(name: "Nick", email: "testemail1@mail.com")
        user_2 = User.create!(name: "Mike", email: "testemail2@mail.com")

        visit "/users/#{user_1.id}"

        expect(current_path).to eq("/users/#{user_1.id}")
        expect(page).to have_content("Nick's Dashboard")
        expect(page).to have_no_content("Mike's Dashboard")
    end

    it "shows a 'discover movies' button" do 
        user_1 = User.create!(name: "Nick", email: "testemail1@mail.com")
        user_2 = User.create!(name: "Mike", email: "testemail2@mail.com")

        visit "/users/#{user_1.id}"
        expect(page).to have_content("Discover Movies")
    end

    it "shows a user's view parties along with a status" do 
        user_1 = User.create!(name: "Nick", email: "testemail1@mail.com")
        user_2 = User.create!(name: "Mike", email: "testemail2@mail.com")
        user_3 = User.create!(name: "Bob", email: "testemail3@mail.com")
        null = User.create!(name: "Null", email: "Null")

        test_text_1 = "Fellowship of the Ring"
        test_text_2 = "Star Wars"
        test_text_3 = "Nightmare on Elm Street"

        view_party_1 = ViewParty.create!(host_id: user_1.id, movie_details: test_text_1, party_duration: 180, event_date: Time.new(2022, 8, 28, 15, 30, 0), created_at: Time.now, updated_at: Time.now)
        view_party_2 = ViewParty.create!(host_id: user_2.id, movie_details: test_text_2, party_duration: 240, event_date: Time.new(2022, 9, 15, 12, 0, 0), created_at: Time.now, updated_at: Time.now)
        view_party_3 = ViewParty.create!(host_id: user_3.id, movie_details: test_text_3, party_duration: 120, event_date: Time.new(2022, 10, 31, 2, 15, 2), created_at: Time.now, updated_at: Time.now)

        user_1_view_party_1 = UserViewParty.create!(user_id: user_1.id, view_party_id: view_party_1.id)
        user_1_view_party_2 = UserViewParty.create!(user_id: user_1.id, view_party_id: view_party_2.id)


        visit "/users/#{user_1.id}"
            within("#viewing_parties_#{view_party_1.id}") do
            expect(page).to have_content("Fellowship of the Ring")
            expect(page).to have_content("Hosting")
            expect(page).to have_no_content("Star Wars")
            expect(page).to have_no_content("Invited")
        end
            within("#viewing_parties_#{view_party_2.id}")do
            expect(page).to have_content("Star Wars")
            expect(page).to have_content("Invited")
            expect(page).to have_no_content("Fellowship of the Ring")
            expect(page).to have_no_content("Hosting")
        end
    end

    it "has a link to Discover Movies" do
        user_1 = User.create!(name: "Bob", email: "testemail1@mail.com")
        visit "/users/#{user_1.id}"
        expect(page).to have_content("Discover Movies")
        click_on("Discover Movies")
        expect(current_path).to eq("/users/#{user_1.id}/discover")
    end
end