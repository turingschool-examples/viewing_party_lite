require 'rails_helper'

RSpec.describe "viewing party new page", type: :feature do

    it 'has a viewing party new page', :vcr do
        user = User.create!(first_name: "Homer", last_name: "Simpson", email:"name@test.com", created_at: Time.now, updated_at: Time.now)
       
        visit "/users/#{user.id}/movies/278"

        click_button("Create Viewing Party for The Shawshank Redemption")

        expect(current_path).to eq("/users/#{user.id}/movies/278/viewing-party/new")
        expect(page).to have_content("The Shawshank Redemption")
    end

    it 'has a viewing party new page with a default runtime that can be adjusted', :vcr do
        user = User.create!(first_name: "Homer", last_name: "Simpson", email:"name@test.com", created_at: Time.now, updated_at: Time.now)
       
        visit "/users/#{user.id}/movies/278/viewing-party/new"
       
        expect(page).to have_field("runtime", with: "142")
    end

    xit 'has a viewing party new page with a default runtime that cannot be lower than the movie runtime', :vcr do
        user = User.create!(first_name: "Homer", last_name: "Simpson", email:"name@test.com", created_at: Time.now, updated_at: Time.now)
       
        visit "/users/#{user.id}/movies/278/viewing-party/new"

        fill_in("runtime", with: "120")
        #finish fields 
        click_on("Create Viewing Party")
       
        expect(current_path).to eq("/users/#{user.id}/movies/278/viewing-party/new")
    end

    it 'has a viewing party new page with the ability to select a date', :vcr do
        user = User.create!(first_name: "Homer", last_name: "Simpson", email:"name@test.com", created_at: Time.now, updated_at: Time.now)
       
        visit "/users/#{user.id}/movies/278/viewing-party/new"

        fill_in("date", with: "2022/10/03")
    end

    it 'has a viewing party new page with the ability to select a time', :vcr do
        user = User.create!(first_name: "Homer", last_name: "Simpson", email:"name@test.com", created_at: Time.now, updated_at: Time.now)
       
        visit "/users/#{user.id}/movies/278/viewing-party/new"
        
        fill_in("time", with: "05:25AM")
    end
end 