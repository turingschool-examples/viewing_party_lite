require 'rails_helper'

RSpec.describe 'user dashboard' do
    before :each do
        @user1 = User.create!(email: 'jake.taffer@gmail.com', name: 'Jake')
    end

    it 'lists the users name at the top of the page' do
        visit users_dashboard_path(@user)

        expect(page).to have_content("Jake's Dashboard")
    end 

    it 'has a button to discover movies' do 
        visit users_dashboard_path(@user)

        expect(page).to have_button("Discover Movies")
    end
end