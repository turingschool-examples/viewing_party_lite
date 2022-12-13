require 'rails_helper'

RSpec.describe 'movies show page', :vcr do
  before :each do
    @user_1 = create(:user)
    @user_2 = create(:user)
  end
  
  it 'has a button to create a viewing party' do
    VCR.insert_cassette "button_view"
    visit user_movie_path(@user_1, 238)

    expect(page).to have_button("Create Viewing Party for The Godfather")
    click_on "Create Viewing Party for The Godfather"
    
    VCR.insert_cassette "new_party"
    expect(current_path).to eq("/users/#{@user_1.id}/movies/238/viewing_parties/new")
    
    VCR.eject_cassette
    VCR.eject_cassette
  end

  it 'has a button to return to the discover page' do
    visit user_movie_path(@user_1, 238)

    expect(page).to have_button("Discover Movies")
  end

  it 'has the movie title, vote average, runtime, genres, summary, 10 cast members, count of reviews, and each reviews author and review', :vcr do
    visit user_movie_path(@user_1, 238)

    expect(page).to have_content("The Godfather")
    expect(page).to have_content("Vote average: 8.7")

    within("#genres") do
      expect(page).to have_content("Drama")
      expect(page).to have_content("Crime")
    end

    expect(page).to have_content("Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.")
    
    within("#cast") do
      expect(page).to have_content("Marlon Brando")
      expect(page).to have_content("Character: Don Vito Corleone")
    end
    
    within("#reviews") do
      expect(page).to have_content("Reviews: 2")
      expect(page).to have_content("The best movie ever...\r A masterpiece by the young and talented Francis Ford Coppola, about a Mob family and their drama, the story telling is perfect, the acting good, sometimes a little over the top in the case of Thalia Shire (the sister of the director)\r \r The 70's were the best years for Hollywood.")
      expect(page).to have_content("crastana")
    end
  end
end