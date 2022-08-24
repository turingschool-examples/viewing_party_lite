require 'rails_helper'


RSpec.describe 'user discover movies page' do 
    it "has a button to find top rated movies" do 
        user_1 = User.create!(name: "ODB", email: "testemail1@mail.com")
        visit "/users/#{user_1.id}/discover"
        click_on("Find Top Rated Movies")
        expect(current_path).to eq("/users/#{user_1.id}/movies")
    end

    it "has a button to search for a particular movie" do 
        user_1 = User.create!(name: "ODB", email: "testemail1@mail.com")
        visit "/users/#{user_1.id}/discover"
        fill_in :search, with: 'Sanders'
        save_and_open_page
        click_button 'Search'
        # expect(page.status_code).to eq 200 < needs content, probably from a cassette fixture
        expect(current_path).to eq("/users/#{@user.id}/search")
    end

end