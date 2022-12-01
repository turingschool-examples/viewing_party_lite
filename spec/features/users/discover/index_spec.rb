require 'rails_helper'

RSpec.describe 'The Discover Movies Page' do
  describe 'As a User' do
    describe 'When I visit the Discover Movies Page' do
      before(:each) do
        @user1 = User.create!(name: 'Mary', email: 'mary@gmail.com')
        @user2 = User.create!(name: 'Larry', email: 'larry@hotmail.com')
        @user3 = User.create!(name: 'Sherri', email: 'sherri@aol.com')
      end

      it "displays a button to 'Find Top Rated Movies'" do
        visit user_discover_index_path(@user1)

        expect(page).to have_button('Find Top Rated Movies')

        click_button('Find Top Rated Movies')

        expect(current_path).to eq(user_movies_path(@user1))
      end


    end
  end

end