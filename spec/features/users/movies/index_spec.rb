require 'rails_helper' 

RSpec.describe 'User Movies Index Page' do 
  before :each do 
    @user1 = create(:user)
  end

  describe 'navigation' do 
    it 'should have a discover page button' do 
      visit user_movies_path(@user1)

      click_button "Discover Page"

      expect(current_path).to eq(discover_user_path(@user1))
    end
  end

  describe 'top movies' do 
    it 'should display the top 20 rated movies' do 
      visit user_movies_path(@user1)

      within(".movies") do
        within("section#movie-238") do 
          expect(page).to have_link("The Godfather", href: "/users/#{@user1.id}/movies/238")
          expect(page).to have_content("Vote Average: 8.7")
        end
        
        expect(page).to have_selector('section', count: 20)
      end
    end
  end

  describe 'search movies' do 
    it 'should display the top 20 movies matching users search criteria' do 
      visit user_movies_path(user_id: @user1.id, title_search: "river")

      expect(page).to have_content("Movie results for: river")

      within(".movies") do
        within("section#movie-395834") do 
          expect(page).to have_link("Wind River", href: "/users/#{@user1.id}/movies/395834")
          expect(page).to have_content("Vote Average: 7.4")
        end

        expect(page).to have_selector('section', count: 20)
      end
    end
  end
end