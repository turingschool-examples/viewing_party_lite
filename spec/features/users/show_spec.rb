require 'rails_helper'

RSpec.describe 'the user dashboard' do 
  before(:each) do 
    @user = create(:user)

    @party1 = create(:movie_party)
    @party2 = create(:movie_party)
    @party3 = create(:movie_party)

    @ump1 = UserMovieParty.create!(user_id: @user.id, movie_party_id: @party1.id, status: 0)
    @ump2 = UserMovieParty.create!(user_id: @user.id, movie_party_id: @party2.id, status: 1)

    visit user_path(@user)
  end

  describe 'sections' do 
    it 'shows "user names dashboard" at top of page' do 
      expect(page).to have_content("#{@user.name}'s Dashboard")
    end

    it 'has a button to discover movies' do 
      expect(page).to have_button('Discover Movies')
      click_button 'Discover Movies'
      expect(current_path).to eq("/users/#{@user.id}/discover")
    end

    it 'lists viewing parties that user is associated with' do 
      within "#party-#{@party1.id}" do 
        expect(page).to have_content(@party1.movie_title)
        expect(page).to have_content(@party1.start_time.strftime("%B %d, %Y - %H:%M%p"))
        expect(page).to have_content(@ump1.status)
      end
      within "#party-#{@party2.id}" do 
        expect(page).to have_content(@party2.movie_title)
        expect(page).to have_content(@party2.start_time.strftime("%B %d, %Y - %H:%M%p"))
        expect(page).to have_content(@ump2.status)
      end

      expect(page).to_not have_content(@party3.movie_title)
    end

    it 'has an image for each movie'
  end

end