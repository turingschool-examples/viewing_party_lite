require 'rails_helper'

RSpec.describe 'movie show page' do
  before :each do
    @user1 = User.create!(name: 'tom', email: 'tom.gmail.com', password: "password123")

    visit "/users/#{@user1.id}/discover"

    click_button 'Top Rated Movies'

    click_link 'The Shawshank Redemption'
  end

  it 'has a button to create a viewing party', :vcr do
    expect(page).to have_button('Create a viewing party')
    expect(page.status_code).to eq 200
  end

  it 'has a button to return to the discover page', :vcr do
    expect(page).to have_button('Discover more movies')

    click_button "Discover more movies"
    expect(page.status_code).to eq 200

    expect(current_path).to eq("/users/#{@user1.id}/discover")
  end

  it 'shows movie information', :vcr do
    expect(page.status_code).to eq 200
    expect(page).to have_content("The Shawshank Redemption")
    expect(page).to have_content("Overview: Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.")
    expect(page).to have_content("Genres: Drama Crime")
    expect(page).to have_content("Tim Robbins as Andy Dufresne")
    expect(page).to have_content("Vote average: 8.714")
    expect(page).to have_content("Total number of reviews: 7")
    expect(page).to have_content("Author: elshaarawy Review: very good movie 9.5/10 ")
  end


end
