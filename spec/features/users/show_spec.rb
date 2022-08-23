require 'rails_helper'

RSpec.describe "users show page", type: :feature do

    it 'has a users show  page' do
       user = User.create!(first_name: "Homer", last_name: "Simpson", email:"name@test.com", created_at: Time.now, updated_at: Time.now)
       
        visit "/users/#{user.id}"

        save_and_open_page

        expect(page).to have_content("Homer Simpson's Dashboard")
        expect(page).to have_button("Discover Movies")
        expect(page).to have_content("Viewing Parties")
    end
end