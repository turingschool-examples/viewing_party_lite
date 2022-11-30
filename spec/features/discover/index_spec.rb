require "rails_helper"

RSpec.describe "discover index page " do
  describe 'discover page' do 
    before :each do 
      @steve = User.create!(name: "Steve", email: "steve.smith@gmail.com")
      @mary = User.create!(name: "Mary", email: "mary.smith@gmail.com")
    end
    it 'has a button to find top rated movies' do 
      visit user_discover_path(@steve)

      click_button "Find Top Rated Movies"
      expect(current_path).to eq("/users/#{@steve.id}/movies/search")
      expect(page.status_code).to eq 200 
      expect(page).to have_content("Black Adam")
    end
  end
  
end