require 'rails_helper'

RSpec.describe "User Discover", type: :feature do
    it 'has a button to discover top rated movies', :vcr do

        @user1 = User.create!(name: "Micheal Jordan", email: "user1@gmail.com")

        visit "/users/#{@user1.id}/discover"

        click_button "Discover Top Rated Movies"
        
        expect(current_path).to eq("/users/#{@user1.id}/movies")
    end
  end

  #   it 'has text field to search key words then redirects to matching list' do
  #       @user1 = User.create!(name: "Micheal Jordan", email: "user1@gmail.com")

  #       visit "/users/#{@user1.id}/discover"

  #       fill_in :movie_title, with: 'Shawshank Redemption'
  #       click_on "Search"
  #   end
  # end

