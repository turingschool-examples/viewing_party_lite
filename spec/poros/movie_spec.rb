require 'rails_helper'

RSpec.describe 'Movie POROS' do
  it 'has to do what I say' do
    @movie_data = {:adult=>false,
                  :backdrop_path=>"/rSPw7tgCH9c6NqICZef4kZjFOQ5.jpg",
                  :genre_ids=>[18, 80],
                  :id=>238,
                  :original_language=>"en",
                  :original_title=>"The Godfather",
                  :overview=>
                  "Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.",
                  :popularity=>97.35,
                  :poster_path=>"/3bhkrj58Vtu7enYsRolD1fZdja1.jpg",
                  :release_date=>"1972-03-14",
                  :title=>"The Godfather",
                  :video=>false,
                  :vote_average=>8.7,
                  :vote_count=>16727}

    @movie = Movie.new(@movie_data)

    expect(@movie).to be_a Movie
    expect(@movie.title).to eq('The Godfather')
    expect(@movie.vote_average).to eq(8.7)
  end
end
