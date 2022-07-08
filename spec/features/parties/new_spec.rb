require 'rails_helper'

RSpec.describe 'Creating a viewing party from a movie show page', :vcr do
    before :each do
        @user1 = User.create!(email: 'jake.taffer@gmail.com', name: 'Jake')
    end

    xit 'has a button to create a viewing party' do

        visit user_movies_path(@user1.id)

        click_on 'The Shawshank Redemption'
        # binding.pry
        click_on 'Create Viewing Party'
        save_and_open_page
        expect(current_path)

        expect(page).to have_content('New Viewing party')

        fill_in 'duration', with: 150
        fill_in 'date', with: '2014-12-01'
        fill_in 'time', with: '01:29:18'
        fill_in 'user_name', with: 'Jake'

    end
end