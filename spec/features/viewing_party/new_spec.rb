require 'rails_helper'

RSpec.describe "viewing party new page", type: :feature do

    it 'has a viewing party new page', :vcr do
        user = User.create!(first_name: "Homer", last_name: "Simpson", email:"name@test.com", created_at: Time.now, updated_at: Time.now)
       
        visit "/users/#{user.id}/movies/278"

        click_button("Create Viewing Party for The Shawshank Redemption")

        expect(current_path).to eq("/users/#{user.id}/movies/278/viewing-party/new")
        expect(page).to have_content("The Shawshank Redemption")
    end

    it 'has a viewing party new page with a default runtime that can be adjusted - happy path', :vcr do
        user = User.create!(first_name: "Homer", last_name: "Simpson", email:"name@test.com", created_at: Time.now, updated_at: Time.now)
       
        visit "/users/#{user.id}/movies/278/viewing-party/new"
        # save_and_open_page
        expect(page).to have_field(:runtime, :with => 142)
    end
end 