require 'rails_helper'

RSpec.describe Movie do 
    before :each do 
        @movie_hash = {id: 1, title: 'No Country For Old Men', genres: 'Western', overview: 'Gritty cowboy movie', vote_average: 8.4, runtime:70, poster_path: 'dksa;jflk30', imdb_id: 54930}
    end
    it 'will create a movie object with all attributes' do 
        movie = Movie.new(@movie_hash)
        expect(movie.id).to eq(1)
        expect(movie.title).to eq('No Country For Old Men')
        expect(movie.genres).to eq('Western')
        expect(movie.summary).to eq('Gritty cowboy movie')
        expect(movie.vote_average).to eq(8.4)
        expect(movie.minutes).to eq(70)
        expect(movie.duration).to eq("1 hour(s) and 10 minute(s)")
        expect(movie.poster_path).to eq("dksa;jflk30")
        expect(movie.imdb_id).to eq(54930)
    end
end