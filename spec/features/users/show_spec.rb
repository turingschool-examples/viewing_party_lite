require 'rails_helper'

RSpec.describe 'User Show Page' do
  describe 'view' do
    before(:each) do
      @user_1 = User.create!(name: "David", email: "david@email.com", password: 'test', password_confirmation: 'test')
      @party_1 = @user_1.parties.create!(duration: 180, day: "December 12, 2021", start_time: "7:00 pm", movie_id: 1, user_id: @user_1.id)
    end

    it 'has a home link which takes the user back to the home page' do
      visit "/users/#{@user_1.id}"

      click_link('Home')
      expect(current_path).to eq(root_path)
    end

    it 'includes users name Dashboard" at the top of the page' do
      visit "/users/#{@user_1.id}"

      expect(page).to have_content("David's Dashboard")
    end

    it 'includes A button to Discover Movies' do
      visit "/users/#{@user_1.id}"

      expect(page).to have_link("Discover Movies")
      click_link("Discover Movies")
      expect(current_path).to eq("/users/#{@user_1.id}/discover")
    end

    it 'has a section for viewing parties' do
      visit "/users/#{@user_1.id}"

      expect(page).to have_content(@party_1.day)
      expect(page).to have_content(@party_1.start_time)
    end
  end
end
