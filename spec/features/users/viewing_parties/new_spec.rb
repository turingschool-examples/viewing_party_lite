require 'rails_helper'

RSpec.describe 'New Viewing Party Page' do 
  before :each do 
    @user = create(:user)
    @movie_id = 14
    @user2 = User.create(name: "River", email: "river@example.com")
    @user3 = User.create(name: "Bodi", email: "bodi@example.com")
    @user4 = User.create(name: "Dean", email: "dean@example.com")
    visit new_user_movie_viewing_party_path(@user.id, @movie_id)
  end
  
  describe 'page layout' do 
    it 'should have a discover page button' do 
      visit user_movies_path(@user)

      click_button "Discover Page"

      expect(current_path).to eq(discover_user_path(@user))
    end

    it 'displays the movie that user is creating a party for' do 

      expect(page).to have_content("Create a Movie Party for American Beauty")
    end
  end

  describe 'New viewing party form - happy path' do 
    it 'has a form to create a viewing party' do 
      user1 = User.create(name: "River", email: "river@example.com")
      user2 = User.create(name: "Bodi", email: "bodi@example.com")
      user3 = User.create(name: "Dean", email: "dean@example.com")

      within(".new_viewing_party_form") do 
        expect(page).to have_field("Movie Title", with: "American Beauty", disabled: true)

        fill_in("Duration of Party", with: 180)
        select("2025", from: "[date(1i)]")
        select("March", from: "[date(2i)]")
        select("5", from: "[date(3i)]")
        select("20", from: "[start_time(4i)]")
        select("00", from: "[start_time(5i)]")
        page.check(@user2.display_name)
        page.check(@user3.display_name)
        click_button "Create Party"
  
        expect(current_path).to eq(user_path(@user.id))
      end
    end
  end

  describe 'New viewing party form - sad path' do 

  end

end