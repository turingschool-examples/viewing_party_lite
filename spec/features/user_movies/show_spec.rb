require 'rails_helper'

RSpec.describe 'Movie Discover Page' do
  describe 'home page link' do
    before(:each) do
      @user_1 = User.create!(name: "David", email: "david@email.com")
      @party_1 = @user_1.parties.create!(duration: 180, day: "December 12, 2021", start_time: "7:00 pm", movie_id: 1, user_id: @user_1.id)
    end
    it 'has a home link which takes the user back to the home page' do
      visit "/users/#{@user_1.id}/movies"

      click_link('Home')
      expect(current_path).to eq(root_path)
    end

    it 'goes back to discover page after filling in form when clicking button' do
      visit "/users/#{@user_1.id}/movies?query=top%40rated"


      expect(page).to have_link("The Shawshank Redemption")

      click_link("The Shawshank Redemption")

      expect(current_path).to eq("/users/#{@user_1.id}/movies/278")

      click_button 'Discover Page'
      save_and_open_page
      expect(current_path).to eq("/users/#{@user_1.id}/discover")
    end
  end
end
