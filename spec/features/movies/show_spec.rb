require 'rails_helper'

RSpec.describe 'Movie Details Page', type: :feature do

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

      within "#review_section" do
        expect(page).to have_content("2 Reviews")
      end

      within "#reviews-0" do
        expect(page).to have_content("Author: talisencrw")
        expect(page).to_not have_content("Author: Wuchak")
      end

      within "#reviews-1" do
        expect(page).to have_content("Author: Wuchak")
        expect(page).to_not have_content("Author: talisencrw")
      end
    end

    it 'displays content of review' do
      user = User.create!(name: "Nancy", email: "nancydrew@email.com")

      visit user_movie_path(user.id, 500)

      within "#reviews-0" do
        expect(page).to have_content(
          "This unique take on the heist-film-gone-wrong was excellent--stylish and intelligently made, yet very funny and inexpensive. Tarantino's accolades from giving American cinema the resuscitation it needed mirrors what has happened, at least since the 70's, with Martin Scorsese's 'Mean Streets', both in terms of entertaining violence and usage of music in the scoring of films. I greatly thank Harvey Keitel for taking a chance on Tarantino back then--It paid off in spades."
        )
      end
    end
  end
end