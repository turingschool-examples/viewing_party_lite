require 'rails_helper'

RSpec.describe 'Movie details page' do
  describe 'As a user when I visit the Movie details page' do
    it 'displays a button to create a viewing party and a button to return to the discover page' do
      user1 = User.create!(name: 'Will', email: '123@mail.com')
      user2 = User.create!(name: 'Craig', email: 'abc@mail.com')

      visit "/users/#{user1.id}/movies/278?user_id=#{user1.id}"
      click_button "Discover"
      expect(current_path).to eq("/users/#{user1.id}/discover")
      click_button "Discover Top Rated Movies"
      click_link "The Shawshank Redemption"
      click_button "Create a Viewing Party"

      expect(current_path).to eq("/users/#{user1.id}/movies/278/viewing-party/new")
      expect(current_path).to_not eq("/users/#{user2.id}/movies/278/viewing_party/new")
      expect(current_path).to_not eq("/users/#{user1.id}/movies/52886/viewing_party/new")
    end

    it 'displays movie details' do
      user1 = User.create!(name: 'Will', email: '123@mail.com')
      user2 = User.create!(name: 'Craig', email: 'abc@mail.com')

      visit "/users/#{user1.id}/movies/278?user_id=#{user1.id}"

      summary = "Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope."

      expect(page).to have_content("The Shawshank Redemption")
      expect(page).to have_content("8.7")
      expect(page).to have_content("142")
      expect(page).to have_content("Drama")
      expect(page).to have_content("Crime")
      expect(page).to have_content(summary)
      expect(page).to have_content("Tim Robbins")
      expect(page).to have_content("Morgan Freeman")
      expect(page).to have_content("Bob Gunton")
      expect(page).to have_content("William Sadler")
      expect(page).to have_content("Clancy Brown")
      expect(page).to have_content("Gil Bellows")
      expect(page).to have_content("Mark Rolston")
      expect(page).to have_content("James Whitmore")
      expect(page).to have_content("Jeffrey DeMunn")
      expect(page).to have_content("Larry Brandenburg")

      expect(page).to_not have_content("Neil Giuntoli")
    end
  end
end