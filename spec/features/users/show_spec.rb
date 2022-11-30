require 'rails_helper'

RSpec.describe "user dashboard page" do 
  before(:each) do
    @steve = User.create!(name: "Steve", email: "steve.smith@gmail.com")
    @mary = User.create!(name: "Mary", email: "mary.smith@gmail.com")
  end
  describe 'user show' do 
    it 'has a button to discover movies for this user' do 
      visit user_path(@mary)
      expect(page).to have_content("Mary's Dashboard")
      expect(page).to_not have_content("Steve's Dashboard")
      expect(page).to have_button("Discover Movies")
      within "#discover" do 
        click_button "Discover Movies"
        expect(current_path).to eq(user_discover_path(@mary))
        expect(current_path).to_not eq(user_discover_path(@steve))
      end
      expect(page).to have_content("Discover Movies")

    end
  end
end