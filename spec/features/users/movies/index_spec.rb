require 'rails_helper'

RSpec.describe 'Movies Results Page' do
  before :each do
    @user = create(:user)
  end
  it 'can show 20 top rated movies' do
    VCR.use_cassette "top_rated" do
      visit user_discover_index_path(@user)
      
      click_button("Find Top Rated Movies")
      
      expect(page).to have_content("Vote Average:", count: 20)
      
      within '#movie-1' do
        expect(page).to have_link('The Godfather')
        expect(page).to have_content('Vote Average: 8.7') 
      end
      within '#movie-2' do
        expect(page).to have_link('Shawshank Redemption')
        expect(page).to have_content('Vote Average: 8.7') 
      end
      within '#movie-3' do
        expect(page).to have_link('The Godfather Part II')
        expect(page).to have_content('Vote Average: 8.6') 
      end
    end
  end
  
  it 'each movie title link leads to movie details page' do
    VCR.use_cassette "top_rated" do
      visit user_movies_path(@user, q: 'top_rated')
      
      VCR.use_cassette "movie_details" do
        click_link 'The Godfather'
        expect(current_path).to eq user_movie_path(@user, id: '238')
      end
    end

    VCR.use_cassette "keyword_search_lego" do
      visit user_movies_path(@user, q: 'Lego')
      
      VCR.use_cassette "movie_details_lego" do
        click_link "The Lego Movie"
        expect(current_path).to eq user_movie_path(@user, id: '137106')
      end
    end
  end

  it 'has a button to return to Discover Page' do
    visit "/users/#{@user.id}/movies?q=top_rated"
    
    click_button("Discover Page")

    expect(current_path).to eq user_discover_index_path(@user)    
  end

  it 'shows 20 movies from a keyword search' do
    visit user_discover_index_path(@user)

    fill_in(:q, with: 'Lego')
    click_button('Find Movies')

    expect(page).to have_content("Vote Average:", count: 20)

    within '#movie-1' do
      expect(page).to have_link('The Lego Movie')
      expect(page).to have_content('Vote Average: 7.4') 
    end
    within '#movie-2' do
      expect(page).to have_link('The Lego Batman Movie')
      expect(page).to have_content('Vote Average: 7.2') 
    end
    within '#movie-3' do
      expect(page).to have_link('The Lego Ninjago Movie')
      expect(page).to have_content('Vote Average: 6.5') 
    end
  end

  it 'shows error message if search is blank' do
    visit user_discover_index_path(@user)

    click_button('Find Movies')

    expect(current_path).to eq(user_discover_index_path(@user))

    expect(page).to have_content("Error: Search must be specified")
  end
end