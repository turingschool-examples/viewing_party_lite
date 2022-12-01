require 'rails_helper'

RSpec.describe 'the new viewing parties page' do 
  before(:each) do 
    @user1 = create(:user)
    @user2 = create(:user)
    @user3 = create(:user)
    
    VCR.use_cassette('godfather_movie') do 
      @movie = MoviesFacade.get_movie_lite(238)
    end

    VCR.use_cassette('godfather_movie') do
      visit new_user_movie_viewing_party_path(@user1, @movie.id)
    end
  end

  describe 'layout' do 
    it 'has movie title at the top of the screen' do 
      expect(page).to have_content("Create a Movie Party for #{@movie.movie_title}")
    end

    it 'has a button to return to discover page' do 
      click_button 'Discover Page'

      expect(current_path).to eq(user_discover_index_path(@user1))
    end
  end

  describe 'creating a new viewing party' do 
    it 'has a form to create a new viewing party' do 
      within '#viewing_party_form' do 
        expect(page).to have_field('Movie Title', with: @movie.movie_title)
        expect(page).to have_field('Duration of Party')
        fill_in 'Duration of Party', with: 400

        expect(page).to have_field('Start Time')
        fill_in 'Start Time', with: DateTime.now

        expect(page).to have_unchecked_field(@user2.name)
        expect(page).to have_unchecked_field(@user3.name)
        expect(page).to_not have_unchecked_field(@user1.name)
        check @user2.name

        click_button 'Create Party'
      end
    end
  end
end