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
end