require 'rails_helper'

RSpec.describe 'User Movie Show Page', type: :feature do
  before :each do
    user1 = User.create!(name: 'Skeeter', email: 'skeeter@skeeter.com', password: 'test')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
  end


  it 'Provides details for an individual movie', :vcr do
    visit "/movies/278"

    within '#movie-details' do
      expect(page).to have_content("The Shawshank Redemption")
      expect(page).to have_content("Vote Average: 8.7")
      expect(page).to have_content("2h 22m")
      expect(page).to have_content("Drama")
      expect(page).to have_content("Crime")
      expect(page).to have_content("Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.")
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
    end
  end

  it 'Possesses functional link back to discover page', :vcr do
    visit "/movies/278"
  
    within "#links" do
      expect(page).to have_button("Discover Page")
    end
  end

  it 'Possesses link to create new party', :vcr do
    visit "/movies/278"

    within "#links" do
      expect(page).to have_button("Create New Watch Party")
    end
  end
end