require 'rails_helper'

RSpec.describe "users discover page", type: :feature do

    it 'has a users discover page' do
       user = User.create!(first_name: "Homer", last_name: "Simpson", email:"name@test.com", created_at: Time.now, updated_at: Time.now)
       
        visit "/users/#{user.id}"

        click_button("Discover Movies")

        expect(current_path).to eq("/users/#{user.id}/discover")

        expect(page).to have_button("Discover Top Rated Movies")
    end
end