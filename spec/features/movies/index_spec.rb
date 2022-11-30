require "rails_helper"

RSpec.describe "discover movies page or movies index page " do
  describe 'discover page' do 
    before :each do 
      @steve = User.create!(name: "Steve", email: "steve.smith@gmail.com")
      @mary = User.create!(name: "Mary", email: "mary.smith@gmail.com")
    end
    it 'lists popular movies' do 
      # visit user_discover_path(@steve)
      # # require 'pry'; binding.pry

      # click_button "Find Top Rated Movies"
      # expect(page.status_code).to eq 200 
      # expect(page).to have_content("Black Adam")
    end
  end
  
end