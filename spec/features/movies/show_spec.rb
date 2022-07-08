require 'rails_helper'

RSpec.describe 'Movie details page', :vcr do
    before :each do
        @user1 = User.create!(email: 'jake.taffer@gmail.com', name: 'Jake')
    end

    it 'has a button to reate a viewing party' do
        visit user_movies_path(@user1.id)
        
        click_on 'The Shawshank Redemption'
        expect(current_path).to eq(user_movie_path(@user1.id, 278))

        expect(current_path).to eq(user_movie_path(@user1.id, 278))

    end

end