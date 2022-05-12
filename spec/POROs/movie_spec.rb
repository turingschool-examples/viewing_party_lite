require 'rails_helper'

describe Movie do
  before do
    @hash = {
      "adult": false,
            "backdrop_path": "/egoyMDLqCxzjnSrWOz50uLlJWmD.jpg",
            "genres": [
              {id: 28, name: 'Drama'},
              {id: 50, name: 'Action'}
            ],
            "id": 675353,
            "runtime": 139,
            "original_language": "en",
            "original_title": "Sonic the Hedgehog 2",
            "overview": "After settling in Green Hills, Sonic is eager to prove he has what it takes to be a true hero. His test comes when Dr. Robotnik returns, this time with a new partner, Knuckles, in search for an emerald that has the power to destroy civilizations. Sonic teams up with his own sidekick, Tails, and together they embark on a globe-trotting journey to find the emerald before it falls into the wrong hands.",
            "popularity": 12851.144,
            "poster_path": "/6DrHO1jr3qVrViUO6s6kFiAGM7.jpg",
            "release_date": "2022-03-30",
            "title": "Sonic the Hedgehog 2",
            "video": false,
            "vote_average": 7.7,
            "vote_count": 1142
    }

    @cast = [
      {name: 'Cornwallus'},
      {name: 'Billy Bob'}
    ]
  end

  it 'is initialized with a large hash' do
    movie = Movie.new(@hash, @cast)

    expect(movie.title).to eq('Sonic the Hedgehog 2')
    expect(movie.vote_average).to eq(7.7)
    expect(movie.poster_path).to eq('/6DrHO1jr3qVrViUO6s6kFiAGM7.jpg')
    expect(movie.id).to eq(675353)
    expect(movie.overview).to eq(@hash[:overview])
    expect(movie.runtime).to eq('2 hours 19 minutes')

    expect(movie.cast).to be_a(Array)
    expect(movie.cast).to be_all(Hash)
    expect(movie.cast[0][:name]).to be_a(String)

    expect(movie.genres).to be_a(Array)
    expect(movie.genres).to be_all(Hash)
    expect(movie.genres[0][:name]).to be_a(String)
  end

  context 'instance methods' do
    it '.formatted_duration(time) returns the runtime in hours/minutes format' do
      movie = Movie.new(@hash, @cast)

      expect(movie.formatted_duration(139)).to eq('2 hours 19 minutes')
    end
  end
end
