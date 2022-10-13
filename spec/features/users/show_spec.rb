require 'rails_helper'

RSpec.describe "user dashboard" do
  
  describe 'when I visit a user dashboard' do
    let!(:user) { create :user }
    let!(:friend) { create :user }
  
    before :each do
      VCR.use_cassette('user_dashboard') do
        @movies = MoviesFacade.top_rated
        @movie_1 = @movies[0]
        @movie_2 = @movies[1]
        @viewing_party_1 = user.viewing_parties.create!(duration: 300, start_time: Faker::Time.forward(days: 7, period: :evening), movie_id: @movie_1.id)
        @viewing_party_2 = friend.viewing_parties.create!(duration: 300, start_time: Faker::Time.forward(days: 7, period: :evening), movie_id: @movie_2.id)
        visit user_path(user)
      end
    end

    it 'displays a title' do
      expect(page).to have_content("#{user.name}'s Dashboard")
    end

    it 'lists viewing parties for the user' do
      user.viewing_parties.each do |party|
        expect(page).to have_link "Viewing Party ##{party.id}"
      end
    end

    it 'displays a discover movies button that links to a discover page for this specific user' do
      expect(page).to have_button('Discover Movies')

      click_button 'Discover Movies'
      
      expect(current_path).to eq(user_discover_index_path(user))
    end
  end
end