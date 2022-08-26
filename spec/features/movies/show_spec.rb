require 'rails_helper'

RSpec.describe 'Movie Details Page', type: :feature do
  describe '#buttons' do
    it "has button to create a viewing party" do
      user = User.create!(name: "Nancy", email: "nancydrew@email.com")
      visit user_movie_path(user.id, 505)
      click_button "Create a Viewing Party"
      expect(current_path).to eq(new_user_viewing_party_path(user.id, 505)) 
    end
    
    it "has a button to return to discover page" do
      user = User.create!(name: "Nancy", email: "nancydrew@email.com")
      visit user_movie_path(user.id, 505)
      click_button "Return to Discover Page"
      expect(current_path).to eq(user_discover_index_path(user.id)) 
    end
  end

  describe '#reviews' do
    it 'displays number of reviews and the authors' do
      user = User.create!(name: "Nancy", email: "nancydrew@email.com")

      visit user_movie_path(user.id, 500)

      expect(page).to have_content("2 Reviews")

      within "#reviews-0" do
        expect(page).to have_content("Author: talisencrw")
        expect(page).to_not have_content("Author: Wuchak")
      end

      within "#reviews-1" do
        expect(page).to have_content("Author: Wuchak")
        expect(page).to_not have_content("Author: talisencrw")
      end
    end
  end
end