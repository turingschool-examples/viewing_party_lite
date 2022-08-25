require 'rails_helper'

RSpec.describe 'movie detail page' do
  before(:each) do
    @user1 = User.create!(name: "cory", email: "cory@gmail.com")
  end

  it "has a button to create a viewing party and a button to return to discover page", :vcr do
    visit "/users/#{@user1.id}/movies/278"

    click_button("Create Viewing Party")
    expect(current_path).to eq("/users/#{@user1.id}/movies/278/viewing-party/new")

    visit "/users/#{@user1.id}/movies/278"

    click_button("Discover Page")
    expect(current_path).to eq("/users/#{@user1.id}/discover")
  end

  it "shows details about the movie", :vcr do
    visit "/users/#{@user1.id}/movies/278"

    expect(page).to have_content("Title: The Shawshank Redemption")
    expect(page).to have_content("Voting Average: 8.724")
    expect(page).to have_content("Runtime: 2h 22m")
    expect(page).to have_content("Genre: Drama, Crime")
    expect(page).to have_content("Summary: Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.")

  end
end
