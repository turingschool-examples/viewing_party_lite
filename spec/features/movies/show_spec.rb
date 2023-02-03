# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'movie details page' do
  before(:each) do
    @user1 = User.create!(name: 'John Doe', email: 'johndoe@ymail.com')
    stub_request(:get, "https://api.themoviedb.org/3/movie/238?api_key=#{ENV['api_key']}")
      .to_return(status: 200, body: File.read('spec/fixtures/movie_details_godfather238.json'), headers: {})
    stub_request(:get, "https://api.themoviedb.org/3/movie/238/credits?api_key=#{ENV['api_key']}")
      .to_return(status: 200, body: File.read('spec/fixtures/cast_details.json'))
    stub_request(:get, "https://api.themoviedb.org/3/movie/238/reviews?api_key=#{ENV['api_key']}")
      .to_return(status: 200, body: File.read('spec/fixtures/reviews.json'))
  end

  it 'has a link back to the discover page' do
    visit user_movie_path(@user1, 238)

    expect(page).to have_link('Discover Page', href: user_discover_index_path(@user1))
  end

  it 'has a button to create a viewing party' do
    visit user_movie_path(@user1, 238)

    expect(page).to have_link('Create Viewing Party for The Godfather',
                              href: new_user_movie_viewing_party_path(@user1, 238))
  end

  it 'has the average vote, runtime and genres' do
    visit user_movie_path(@user1, 238)

    expect(page).to have_content('Vote: 8.715 Runtime: 2hr 55min Genre(s): Drama and Crime')
  end

  it 'lists the summary' do
    visit user_movie_path(@user1, 238)

    expect(page).to have_content('Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.')
  end

  it 'lists the top 10 credited actors and their character name' do
    visit user_movie_path(@user1, 238)

    expect(page).to have_content("Marlon Brando as Don Vito Corleone, Al Pacino as Don Michael Corleone, James Caan as Santino 'Sonny' Corleone, Robert Duvall as Tom Hagen, Richard S. Castellano as Pete Clemenza, Diane Keaton as Kay Adams, Talia Shire as Constanzia 'Connie' Corleone-Rizzi, Gianni Russo as Carlo Rizzi, Sterling Hayden as Capt. Mark McCluskey, and Al Lettieri as Virgil 'The Turk' Sollozzo")
    expect(page).to_not have_content('Abe Vigoda')
  end

  it 'lists count of reviews and all reviews with an author' do
    visit user_movie_path(@user1, 238)

    expect(page).to have_content('2 Reviews')
    expect(page).to have_content("Review by: crastana Rating: 10.0/10.0 The best movie ever...\r A masterpiece by the young and talented Francis Ford Coppola, about a Mob family and their drama, the story telling is perfect, the acting good, sometimes a little over the top in the case of Thalia Shire (the sister of the director)\r \r The 70's were the best years for Hollywood.")
  end
end
