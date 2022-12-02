require 'rails_helper'

RSpec.describe 'movies show page', :vcr do
  before :each do
    @user_1 = User.create!(name: 'Jim', email: 'jim.halpert@gmail.com')
    @user_2 = User.create!(name: 'Pam', email: 'pam.halpert@gmail.com')
  end
  
  xit 'has a button to create a viewing party' do
    # Details This viewing party button should take the user to the new viewing party page (/users/:user_id/movies/:movie_id/viewing-party/new)
  end

  xit 'has a button to return to the discover page' do

  end

  it 'has the movie title, vote average, runtime, genres, summary, 10 cast members, count of reviews, and each reviews author and review', :vcr do
    visit user_movie_path(@user_1, 238)

    expect(page).to have_content("The Godfather")
    expect(page).to have_content("Vote average: 8.7")
    expect(page).to have_content("Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.")
    expect(page).to have_content("Reviews: 2")
    expect(page).tp have_content("The best movie ever...\r\nA masterpiece by the young and talented Francis Ford Coppola, about a Mob family and their drama, the story telling is perfect, the acting good, sometimes a little over the top in the case of Thalia Shire (the sister of the director)\r\n\r\nThe 70's were the best years for Hollywood.")
    expect(page).to have_content("creastana")
  end
end