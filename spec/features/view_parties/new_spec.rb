require 'rails_helper'

RSpec.describe "View Party New Page", :vcr do
    it 'should have a form to enter name and email' do
        user_1 = User.create!(name: "Nick", email: "testemail1@mail.com")
        user_2 = User.create!(name: "Mike", email: "testemail2@mail.com")
        user_3 = User.create!(name: "Bob", email: "testemail3@mail.com")

        visit "/users/#{user_2.id}/movies/238/view_parties/new"
        


        fill_in('Duration of Party', with: 180)
        fill_in('Date and Time', with: '10/10/2022, 8:30 PM')
        # within("#inviteotherusers") do
        #     click_on("Create New User")
        # end 
        click_button("Create Party")
        expect(current_path).to eq("/users/#{user_2.id}")
    end

    it 'returns you to the new page if all details arent submitted' do
        user_2 = User.create!(name: "Mike", email: "testemail2@mail.com")
        visit "/users/#{user_2.id}/movies/238/view_parties/new"

        fill_in('Duration of Party', with: 180)

        click_button("Create Party")

        expect(page).to have_content("Error: Please fill in all fields.")
        expect(current_path).to eq("/users/#{user_2.id}/movies/238/view_parties/new")
    end
end