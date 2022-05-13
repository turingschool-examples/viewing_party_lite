require 'rails_helper'

RSpec.describe Movie do
  it 'exists' do
    movie_data = {
      title: "Fun Movie",
      id: 4,
      overview: "Lots of laughs for half your family",
      vote_average: 7.2,
      runtime: 102,
      credits: {
        cast: [
          {name: "Matthew Lewis",
           character: "Neville Longbottom"},
          {name: "Emilia Clark",
           character: "Khaleesi"},
          {name: "Orlando Bloom",
           character: "Legolas"},
          {name: "Johnny Depp",
           character: "Captain Jack Sparrow"},
          {name: "Leonardo DiCaprio",
           character: "Jack Dawson"},
          {name: "Robin Williams",
           character: "The Genie"},
          {name: "Matt Damon",
           character: "Jason Bourne"},
          {name: "Mike Meyers",
           character: "Austin Powers"},
          {name: "Jennifer Lawrence",
           character: "Katniss Everdeen"},
          {name: "Brad Pitt",
           character: "Tyler Durden"}
        ]
      },
      reviews: {
        results: [
          {author: "Samwise Gamgee",
           content: "This movie is WILD"},
          {author: "Draco Malfoy",
           content: "It would have been better if my father produced it"}
        ]
      },
      genres: [
        {id: 2,
         name: "Comedy"},
        {id: 5,
         name: "Science Fiction"},
        {id: 1,
         name: "Drama"}
      ]
    }
    movie = Movie.new(movie_data)
    expect(movie).to be_a Movie
    expect(movie.title).to eq(movie_data[:title])
    expect(movie.vote_average).to eq(movie_data[:vote_average])
    expect(movie.id).to eq(movie_data[:id])
    expect(movie.cast).to eq(movie_data[:credits][:cast][0..9])
    expect(movie.runtime).to eq(movie_data[:runtime])
    expect(movie.genres).to eq(movie_data[:genres].map {|g| g[:name]})
    expect(movie.summary).to eq(movie_data[:overview])
    expect(movie.reviews).to eq(movie_data[:reviews][:results])
  end

  it 'only takes the first 10 cast members' do
    movie_data = {
      title: "Fun Movie",
      id: 4,
      overview: "Lots of laughs for half your family",
      vote_average: 7.2,
      runtime: 102,
      credits: {
        cast: [
          {name: "Matthew Lewis",
         character: "Neville Longbottom"},
          {name: "Emilia Clark",
         character: "Khaleesi"},
          {name: "Orlando Bloom",
         character: "Legolas"},
          {name: "Johnny Depp",
         character: "Captain Jack Sparrow"},
          {name: "Leonardo DiCaprio",
        character: "Jack Dawson"},
          {name: "Robin Williams",
         character: "The Genie"},
         {name: "Matt Damon",
         character: "Jason Bourne"},
         {name: "Mike Meyers",
         character: "Austin Powers"},
         {name: "Jennifer Lawrence",
         character: "Katniss Everdeen"},
         {name: "Brad Pitt",
         character: "Tyler Durden"},
         {name: "Tobey Maguire",
         character: "Spiderman"},
         {name: "Julia Roberts",
         character: "Erin Brockovich"}
       ]
      },
      reviews: {
        results: [
          {author: "Samwise Gamgee",
         content: "This movie is WILD"},
          {author: "Draco Malfoy",
         content: "It would have been better if my father produced it"}
        ]
      },
      genres: [
        {id: 2,
          name: "Comedy"},
        {id: 5,
          name: "Science Fiction"},
        {id: 1,
          name: "Drama"}
        ]
      }

    movie = Movie.new(movie_data)
    expect(movie_data[:credits][:cast].count).to eq 12
    expect(movie.cast.count).to eq 10
    included_cast = movie_data[:credits][:cast][0..9]
    character11 = movie_data[:credits][:cast][10]
    character12 = movie_data[:credits][:cast][11]
    included_cast.each do |cast|
      expect(movie.cast.include?(cast)).to be true
    end
    expect(movie.cast.include?(character11)).to be false
    expect(movie.cast.include?(character12)).to be false
  end

  it 'if the key does not exist it returns nil' do
    movie_data = {
      title: "Fun Movie",
      id: 4,
      overview: "Lots of laughs for half your family",
      vote_average: 7.2,
      runtime: 102,
      genres: [
        {id: 2,
          name: "Comedy"},
        {id: 5,
          name: "Science Fiction"},
        {id: 1,
          name: "Drama"}
        ]
      }

    movie = Movie.new(movie_data)
    expect(movie.cast).to eq nil
    expect(movie.reviews).to eq nil
  end

  it 'get_cast' do
    cast1 = {name: "Matthew Lewis", character: "Neville Longbottom"}
    cast2 = {name: "Emilia Clark", character: "Khaleesi"},
    cast3 = {name: "Orlando Bloom", character: "Legolas"},
    cast4 = {name: "Johnny Depp", character: "Captain Jack Sparrow"}
    movie_data = {
      title: "Fun Movie",
      id: 4,
      overview: "Lots of laughs for half your family",
      vote_average: 7.2,
      runtime: 102,
      credits: {
        cast: [cast1, cast2, cast3, cast4]
      },
      reviews: {
        results: [
          {author: "Samwise Gamgee",
         content: "This movie is WILD"},
          {author: "Draco Malfoy",
         content: "It would have been better if my father produced it"}
        ]
      },
      genres: [
        {id: 2,
          name: "Comedy"},
        {id: 5,
          name: "Science Fiction"},
        {id: 1,
          name: "Drama"}
        ]
      }

    movie = Movie.new(movie_data)
    expect(movie.get_cast(movie_data)).to eq([cast1, cast2, cast3, cast4])
  end

  it 'get_genres' do
    movie_data = {
      title: "Fun Movie",
      id: 4,
      overview: "Lots of laughs for half your family",
      genres: [
        {id: 2,
          name: "Comedy"},
        {id: 5,
          name: "Science Fiction"},
        {id: 1,
          name: "Drama"}
        ]
      }

    movie = Movie.new(movie_data)
    expect(movie.get_genres(movie_data)).to eq(["Comedy", "Science Fiction", "Drama"])
  end

  it 'get_reviews' do
    review1 = {author: "Samwise Gamgee", content: "This movie is WILD"},
    review2 = {author: "Draco Malfoy", content: "It would have been better if my father produced it"}

    movie_data = {
      title: "Fun Movie",
      id: 4,
      overview: "Lots of laughs for half your family",
      vote_average: 7.2,
      runtime: 102,
      credits: {
        cast: []
      },
      reviews: {
        results: [review1, review2]
      },
      genres: [
        {id: 2,
          name: "Comedy"},
        {id: 5,
          name: "Science Fiction"},
        {id: 1,
          name: "Drama"}
        ]
      }
    movie = Movie.new(movie_data)
    expect(movie.get_reviews(movie_data)).to eq([review1, review2])
  end

end
