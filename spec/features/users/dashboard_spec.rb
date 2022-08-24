require 'rails_helper'

RSpec.describe "User Dashboard Page", type: :feature do
    it 'displays user attribues, name, discover movies, viewing parties' do
        user1 = User.create!(name: "Micheal Jordan", email: "user1@gmail.com")
        user2 = User.create!(name: "Kobe Bryant", email: "user2@gmail.com")

        visit "/users/#{user1.id}"

        expect(page).to have_current_path(merchants_item_path(item_1))
        expect(page).to have_content("Basket Ball")
        expect(page).to have_content("Description: Wilson 29 in orange ball")
        expect(page).to have_content("Price: 25000")
        expect(page).to_not have_content("Kobe Bryant")
    end

end


# When I visit '/users/:id' where :id is a valid user id,
# I should see:

#  "<user's name>'s Dashboard" at the top of the page
#  A button to Discover Movies*
#  A section that lists viewing parties**
# *more instructions on this in the Dashboard:Discover Movies issue.
# **more instructions on this in the Dashboard:Viewing Parties issue.