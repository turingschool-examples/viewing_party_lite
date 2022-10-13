require 'rails_helper'

RSpec.describe "user dashboard" do
  
  describe 'when I visit a user dashboard', :vcr do
    let!(:user) { create :user }
    let!(:friend) { create :user }
  
    before :each do
        @movies = MoviesFacade.top_rated
        @movie_1 = @movies[0]
        @movie_2 = @movies[1]
        @viewing_party_1 = ViewingParty.create!(duration: 300, start_time: Faker::Time.forward(days: 7, period: :evening), movie_id: @movie_1.id, movie_title: @movie_1.title)
        @viewing_party_2 = ViewingParty.create!(duration: 300, start_time: Faker::Time.forward(days: 7, period: :evening), movie_id: @movie_2.id, movie_title: @movie_2.title)
        @vpu_1 = ViewingPartyUser.create!(user_id: user.id, viewing_party_id:@viewing_party_1.id, hosting: true)
        @vpu_4 = ViewingPartyUser.create!(user_id: friend.id, viewing_party_id:@viewing_party_1.id, hosting: false)

        @vpu_2 = ViewingPartyUser.create!(user_id: user.id, viewing_party_id:@viewing_party_2.id, hosting: false)
        @vpu_3 = ViewingPartyUser.create!(user_id: friend.id, viewing_party_id: @viewing_party_2.id, hosting: true)
        visit user_path(user)
    end

    it 'displays a user name' do
      expect(page).to have_content("#{user.name}'s Dashboard")
    end
    
    it 'displays a discover movies button that links to a discover page for this specific user' do
      expect(page).to have_button('Discover Movies')

      click_button 'Discover Movies'
      
      expect(current_path).to eq(user_discover_index_path(user))
    end
  end
end