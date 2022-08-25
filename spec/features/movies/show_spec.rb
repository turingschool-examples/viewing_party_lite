require 'rails_helper'


RSpec.describe 'movie show page', :vcr do 
    it "can show a movie's show page" do 
        user_1 = User.create!(name: "Nick", email: "testemail1@mail.com")
        user_2 = User.create!(name: "Mike", email: "testemail2@mail.com")

        visit "/users/#{user_1.id}/movies/238"
        expect(page).to have_content("The Godfather")
        expect(page).to have_content("Discover Page")
    end
    
end