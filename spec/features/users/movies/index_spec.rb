require 'rails_helper' 

RSpec.describe 'User Movies Index Page' do 
  before :each do 
    @user1 = create(:user)

    visit user_movies_path(@user1)
  end

  describe 'navigation' do 
    it 'should have a discover page button' do 
     
      click_button "Discover Page"

      expect(current_path).to eq(discover_user_path(@user1))
    end
  end

  describe 'top movies' do 
    it 'should display the top 20 rated movies' do 

      within(".movies") do
        within("section#movie-238") do 
          expect(page).to have_link("The Godfather", href: "/users/#{@user1.id}/movies/238")
          expect(page).to have_content("Vote Average: 8.7")
        end
        expect(page).to have_selector('section', count: 20)
      end
    end
  end
end