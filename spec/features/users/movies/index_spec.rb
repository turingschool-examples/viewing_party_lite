require 'rails_helper'

RSpec.describe 'Movies Results Page' do
  before :each do
    @user = create(:user)
  end
  it 'can show 20 top rated movies' do
    visit user_discover_index_path(@user)

    click_button("Find Top Rated Movies")

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
    within '#movie-4' do
      expect(page).to have_link('Puss in Boots: The Last Wish')
      expect(page).to have_content('Vote Average: 8.6') 
    end
    within '#movie-5' do
      expect(page).to have_link('Dilwale Dulhania Le Jayenge')
      expect(page).to have_content('Vote Average: 8.6') 
    end
    within '#movie-6' do
      expect(page).to have_link("Schindler's List")
      expect(page).to have_content('Vote Average: 8.6') 
    end

    expect(page).to have_content("Vote Average:", count: 20)
  end

  it 'each movie title link leads to movie details page' do
    visit "/users/#{@user.id}/movies?q=top_rated"
    
    click_link 'The Godfather'
    expect(current_path).to eq "/users/#{@user.id}/movies/238"
  end

  it 'has a button to return to Discover Page' do
    visit "/users/#{@user.id}/movies?q=top_rated"
    
    click_button("Discover Page")

    expect(current_path).to eq user_discover_index_path(@user)
  end

  it 'shows 20 movies from a keyword search' do
    visit user_discover_index_path(@user)

    fill_in('keyword', with: 'Lego')
    click_button('Find Movies')
  end
end