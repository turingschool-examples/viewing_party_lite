require 'rails_helper'

RSpec.describe 'Creating a viewing party from a movie show page', :vcr do
    before :each do
        @user1 = User.create!(email: 'jake.taffer@gmail.com', name: 'Jake')
    end

    xit 'has a button to create a viewing party', :vcr do

        visit user_movies_discover_path(@user1.id)
        click_on 'Top Rated'
        click_on 'The Shawshank Redemption'
        
        click_on 'Create Viewing Party'
        
        expect(current_path).to eq(new_user_movie_party_path(@user1.id, 278))
        expect(page).to have_content('New Viewing Party for The Shawshank Redemption')
        expect(page).to have_field('Duration', with: 142)
        fill_in 'Date', with: '2014-12-01'
        fill_in 'Time', with: '01:29:18'
        fill_in 'User name', with: 'Jake'
        fill_in 'Duration', with: 150

        click_button 'Create Party'
        
        expect(current_path).to eq(user_path(@user1))
        
        
        expect(page).to have_content("Jake, The Shawshank Redemption Viewing Party")
    end
end