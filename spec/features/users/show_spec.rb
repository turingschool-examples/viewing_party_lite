require 'rails_helper'

RSpec.describe "users show page", type: :feature do

    it 'has a users show  page', :vcr do
       user = User.create!(first_name: "Homer", last_name: "Simpson", email:"name@test.com", created_at: Time.now, updated_at: Time.now)
       
        visit "/users/#{user.id}"

        expect(page).to have_content("Homer Simpson's Dashboard")
        expect(page).to have_button("Discover Movies")
        expect(page).to have_content("Viewing Parties")
    end

    it 'displays the viewing parties that the user has been invited to or is hosting', :vcr do
        user1 = User.create!(first_name: "Homer", last_name: "Simpson", email:"name@test.com")
        user2 = User.create!(first_name: "James", last_name: "Rock", email:"james@test.com")
        user3 = User.create!(first_name: "Heidi", last_name: "Hello", email:"heidi@test.com")

        viewingparty1 = ViewingParty.create!(start_time: DateTime.parse('3rd Feb 2001 04:00:00'), party_duration_minutes: 200, movie_title: "The Shawshank Redemption", movie_duration_minutes: 142)
            vp1_u1 = ViewingPartyUser.create!(user_id: user1.id, viewing_party_id: viewingparty1.id, status: :hosting)

        viewingparty2 = ViewingParty.create!(start_time: DateTime.parse('10th Feb 2020 12:05:00'), party_duration_minutes: 300, movie_title: "The Godfather", movie_duration_minutes: 175)
            vp2_u1 = ViewingPartyUser.create!(user_id: user1.id, viewing_party_id: viewingparty2.id, status: :invited)
            vp2_u2 = ViewingPartyUser.create!(user_id: user2.id, viewing_party_id: viewingparty2.id, status: :hosting)

        viewingparty3 = ViewingParty.create!(start_time: DateTime.parse('12th Jan 2022 20:00:00'), party_duration_minutes: 130, movie_title: "Spirited Away", movie_duration_minutes: 125)
            vp3_u3 = ViewingPartyUser.create!(user_id: user3.id, viewing_party_id: viewingparty3.id, status: :hosting)

        visit "/users/#{user1.id}"

        within "#viewing-party-#{vp1_u1.id}" do
            expect(page).to have_content("The Shawshank Redemption")
            expect(page).to have_content("February 03, 2001")
            expect(page).to have_content("4:00 AM")
            expect(page).to have_content("Hosting")
        end

        within "#viewing-party-#{vp2_u1.id}" do
            expect(page).to have_content("The Godfather")
            expect(page).to have_content("February 10, 2020")
            expect(page).to have_content("12:05 PM")
            expect(page).to have_content("Invited")
        end

        expect(page).to_not have_content("Spirited Away")
    end

    it 'displays who is hosting the viewing party', :vcr do
        user1 = User.create!(first_name: "Homer", last_name: "Simpson", email:"name@test.com")
        user2 = User.create!(first_name: "James", last_name: "Rock", email:"james@test.com")
        user3 = User.create!(first_name: "Heidi", last_name: "Hello", email:"heidi@test.com")

        viewingparty1 = ViewingParty.create!(start_time: DateTime.parse('3rd Feb 2001 04:00:00'), party_duration_minutes: 200, movie_title: "The Shawshank Redemption", movie_duration_minutes: 142)
            vp1_u1 = ViewingPartyUser.create!(user_id: user1.id, viewing_party_id: viewingparty1.id, status: :hosting)

        viewingparty2 = ViewingParty.create!(start_time: DateTime.parse('10th Feb 2020 12:05:00'), party_duration_minutes: 300, movie_title: "The Godfather", movie_duration_minutes: 175)
            vp2_u1 = ViewingPartyUser.create!(user_id: user1.id, viewing_party_id: viewingparty2.id, status: :invited)
            vp2_u2 = ViewingPartyUser.create!(user_id: user2.id, viewing_party_id: viewingparty2.id, status: :hosting)

        viewingparty3 = ViewingParty.create!(start_time: DateTime.parse('12th Jan 2022 20:00:00'), party_duration_minutes: 130, movie_title: "Spirited Away", movie_duration_minutes: 125)
            vp3_u2 = ViewingPartyUser.create!(user_id: user2.id, viewing_party_id: viewingparty3.id, status: :invited)
            vp3_u3 = ViewingPartyUser.create!(user_id: user3.id, viewing_party_id: viewingparty3.id, status: :hosting)

        visit "/users/#{user1.id}"

        within "#viewing-party-#{vp1_u1.id}" do
            expect(page).to have_content("The Shawshank Redemption")
            expect(page).to have_content("February 03, 2001")
            expect(page).to have_content("4:00 AM")
            expect(page).to have_content("Hosting")
            expect(page).to have_content("Host: Homer Simpson")
        end

        within "#viewing-party-#{vp2_u1.id}" do
            expect(page).to have_content("The Godfather")
            expect(page).to have_content("February 10, 2020")
            expect(page).to have_content("12:05 PM")
            expect(page).to have_content("Invited")
            expect(page).to have_content("Host: James Rock")
        end
    end

    it 'has movie titles link to their respective movie show pages', :vcr do
        user1 = User.create!(first_name: "Homer", last_name: "Simpson", email:"name@test.com")
        user2 = User.create!(first_name: "James", last_name: "Rock", email:"james@test.com")
        user3 = User.create!(first_name: "Heidi", last_name: "Hello", email:"heidi@test.com")

        viewingparty1 = ViewingParty.create!(start_time: DateTime.parse('3rd Feb 2001 04:00:00'), party_duration_minutes: 200, movie_title: "The Shawshank Redemption", movie_duration_minutes: 142)
            vp1_u1 = ViewingPartyUser.create!(user_id: user1.id, viewing_party_id: viewingparty1.id, status: :hosting)

        visit "/users/#{user1.id}"

        click_on "The Shawshank Redemption"

        expect(current_path).to eq("/users/#{user1.id}/movies/278")
    end

    it 'displays all invited users for each viewing party', :vcr do
        user1 = User.create!(first_name: "Homer", last_name: "Simpson", email:"name@test.com")
        user2 = User.create!(first_name: "James", last_name: "Rock", email:"james@test.com")
        user3 = User.create!(first_name: "Heidi", last_name: "Hello", email:"heidi@test.com")

        viewingparty1 = ViewingParty.create!(start_time: DateTime.parse('3rd Feb 2001 04:00:00'), party_duration_minutes: 200, movie_title: "The Shawshank Redemption", movie_duration_minutes: 142)
            vp1_u1 = ViewingPartyUser.create!(user_id: user1.id, viewing_party_id: viewingparty1.id, status: :hosting)
            vp1_u2 = ViewingPartyUser.create!(user_id: user2.id, viewing_party_id: viewingparty1.id, status: :invited)
            vp1_u3 = ViewingPartyUser.create!(user_id: user3.id, viewing_party_id: viewingparty1.id, status: :invited)

        viewingparty2 = ViewingParty.create!(start_time: DateTime.parse('10th Feb 2020 12:05:00'), party_duration_minutes: 300, movie_title: "The Godfather", movie_duration_minutes: 175)
            vp2_u1 = ViewingPartyUser.create!(user_id: user1.id, viewing_party_id: viewingparty2.id, status: :invited)
            vp2_u2 = ViewingPartyUser.create!(user_id: user2.id, viewing_party_id: viewingparty2.id, status: :hosting)
            vp2_u3 = ViewingPartyUser.create!(user_id: user3.id, viewing_party_id: viewingparty2.id, status: :invited)

        viewingparty3 = ViewingParty.create!(start_time: DateTime.parse('12th Jan 2022 20:00:00'), party_duration_minutes: 130, movie_title: "Spirited Away", movie_duration_minutes: 125)
            vp3_u1 = ViewingPartyUser.create!(user_id: user1.id, viewing_party_id: viewingparty3.id, status: :invited)
            vp3_u2 = ViewingPartyUser.create!(user_id: user2.id, viewing_party_id: viewingparty3.id, status: :hosting)

        visit "/users/#{user1.id}"
        
        within "#viewing-party-#{vp1_u1.id}-attendees" do
            expect(page).to have_content("Homer Simpson")
            expect(page).to have_content("James Rock")
            expect(page).to have_content("Heidi Hello")
        end

        within "#viewing-party-#{vp2_u1.id}-attendees" do
            expect(page).to have_content("Homer Simpson")
            expect(page).to have_content("James Rock")
            expect(page).to have_content("Heidi Hello")
        end

        within "#viewing-party-#{vp3_u1.id}-attendees" do
            expect(page).to have_content("Homer Simpson")
            expect(page).to have_content("James Rock")
            expect(page).to_not have_content("Heidi Hello")
        end
    end

    it 'displays an image of the movie for the viewing party', :vcr do
        user1 = User.create!(first_name: "Homer", last_name: "Simpson", email:"name@test.com")
        user2 = User.create!(first_name: "James", last_name: "Rock", email:"james@test.com")
        user3 = User.create!(first_name: "Heidi", last_name: "Hello", email:"heidi@test.com")

        viewingparty1 = ViewingParty.create!(start_time: DateTime.parse('3rd Feb 2001 04:00:00'), party_duration_minutes: 200, movie_title: "The Shawshank Redemption", movie_duration_minutes: 142)
            vp1_u1 = ViewingPartyUser.create!(user_id: user1.id, viewing_party_id: viewingparty1.id, status: :hosting)
            vp1_u2 = ViewingPartyUser.create!(user_id: user2.id, viewing_party_id: viewingparty1.id, status: :invited)
            vp1_u3 = ViewingPartyUser.create!(user_id: user3.id, viewing_party_id: viewingparty1.id, status: :invited)

        viewingparty2 = ViewingParty.create!(start_time: DateTime.parse('10th Feb 2020 12:05:00'), party_duration_minutes: 300, movie_title: "The Godfather", movie_duration_minutes: 175)
            vp2_u1 = ViewingPartyUser.create!(user_id: user1.id, viewing_party_id: viewingparty2.id, status: :invited)
            vp2_u2 = ViewingPartyUser.create!(user_id: user2.id, viewing_party_id: viewingparty2.id, status: :hosting)
            vp2_u3 = ViewingPartyUser.create!(user_id: user3.id, viewing_party_id: viewingparty2.id, status: :invited)

        viewingparty3 = ViewingParty.create!(start_time: DateTime.parse('12th Jan 2022 20:00:00'), party_duration_minutes: 130, movie_title: "Spirited Away", movie_duration_minutes: 125)
            vp3_u1 = ViewingPartyUser.create!(user_id: user1.id, viewing_party_id: viewingparty3.id, status: :invited)
            vp3_u2 = ViewingPartyUser.create!(user_id: user2.id, viewing_party_id: viewingparty3.id, status: :hosting)


        visit "/users/#{user1.id}"
        
        expect(page.html).to include("https://image.tmdb.org/t/p/w500/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg")
        expect(page.html).to include("https://image.tmdb.org/t/p/w500/3bhkrj58Vtu7enYsRolD1fZdja1.jpg")
    end
end