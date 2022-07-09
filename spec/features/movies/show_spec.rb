require 'rails_helper'

RSpec.describe 'Movie details page', :vcr do
    before :each do
        @user1 = User.create!(email: 'jake.taffer@gmail.com', name: 'Jake')
    end

    it 'has a button to reate a viewing party' do
        visit user_movies_path(@user1.id)
        
        click_on 'The Shawshank Redemption'
        expect(current_path).to eq(user_movie_path(@user1.id, 278))

        expect(page).to have_link("Discover")

        expect(page).to have_button("Create Viewing Party")

        expect(page).to have_content('The Shawshank Redemption')
        expect(page).to have_content('8.7')
        expect(page).to have_content('2 hours, 22 minutes')
        expect(page).to have_content('Drama')
        expect(page).to have_content('Crime')
        expect(page).to have_content("Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.\nActors\nTotal Reviews\n21733")
        expect(page).to have_content('Actors')
        expect(page).to have_content('21733')
    end

end