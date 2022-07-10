require 'rails_helper'

RSpec.describe 'Creating a viewing party from a movie show page', :vcr do
    before :each do
        @user1 = User.create!(email: 'jake.taffer@gmail.com', name: 'Jake')
    end

    it 'has a button to create a viewing party', :vcr do

        visit user_movies_path(@user1.id)

        click_on 'The Shawshank Redemption'
        save_and_open_page
        click_on 'Create Viewing Party'
        save_and_open_page
        expect(current_path).to eq(new_user_movie_party_path(@user1.id, 278))
        expect(page).to have_content('New Viewing Party for The Shawshank Redemption')

        fill_in 'duration', with: 150
        fill_in 'date', with: '2014-12-01'
        fill_in 'time', with: '01:29:18'
        fill_in 'user_name', with: 'Jake'

        click_button 'Submit'

        expect(current_path).to eq(user_path(@user1))
    end
end