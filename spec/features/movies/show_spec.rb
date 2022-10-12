require 'rails_helper'

RSpec.describe "Movie Detail Page" do 
  describe 'As a user when I visit the Movies Detail (show) Page', :vcr do
    it 'has movie details' do 
      @user1 = User.create!(name: "Micheal Jordan", email: "user7@gmail.com")

      visit "/users/#{@user1.id}/movies/19404"
      
      expect(page).to have_content("Dilwale Dulhania Le Jayenge")
      expect(page).to have_content("Vote Average: 8.565")
      expect(page).to have_content("Comedy")
      expect(page).to have_content("Drama")
      expect(page).to have_content("Romance")
      expect(page).to have_content("Runtime: 3 hours and 10 minutes")
      expect(page).to have_content("Summary: Raj is a rich, carefree,")
      # expect(page).to have_content("Cast: ")
      # expect(page).to have_content("Total Reviews: ")
      end
    xit 'has button to create viewing party/redirects to new form' do 
      @user1 = User.create!(name: "Micheal Jordan", email: "user7@gmail.com")

      visit "/users/#{@user1.id}/movies/19404"
      expect(page).to have_button("Create Viewing Party")

      click_on "Create Viewing Party"
      expect(current_path).to eq("/users/#{@user1.id}/movies/19404/viewing_party/new")
      end
    
    it 'has button to return to discover page'do 
    @user1 = User.create!(name: "Micheal Jordan", email: "user7@gmail.com")

    visit "/users/#{@user1.id}/movies/19404"
    
    expect(page).to have_button("Discover Movies")
    end
  end
 end