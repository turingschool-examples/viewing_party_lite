require 'rails_helper'

RSpec.describe Movie do
  it 'exists' do
    movie_data = {
      id: '1',
      title: 'When Harry Met Sally',
      vote_average: '7.6',
      runtime: '115',
      genres: [{ "id": 18, "name": 'Drama' }, { "id": 10, "name": 'Rom-Com' }],
      overview: 'classic rom com with classic rom com actors'
    }

    movie = Movie.new(movie_data)

    expect(movie).to be_a Movie
    expect(movie.id).to eq('1')
    expect(movie.title).to eq('When Harry Met Sally')
    expect(movie.vote_avg).to eq('7.6')
    expect(movie.runtime).to eq('115')
    expect(movie.summary).to eq('classic rom com with classic rom com actors')
  end

  describe '#genres' do
    it 'turns genre data into array of genre strings' do
      movie_data = {
        id: '1',
        title: 'When Harry Met Sally',
        vote_average: '7.6',
        runtime: '115',
        genres: [{ "id": 18, "name": 'Drama' }, { "id": 10, "name": 'Rom-Com' }],
        overview: 'classic rom com with classic rom com actors'
      }

      movie = Movie.new(movie_data)

      expect(movie.genres).to eq(['Drama', 'Rom-Com'])
    end
  end

  describe '#runtime_calc' do
    it 'formats run time into Xhr Xmin' do
      movie_data = {
        id: '1',
        title: 'When Harry Met Sally',
        vote_average: '7.6',
        runtime: '115',
        genres: [{ "id": 18, "name": 'Drama' }, { "id": 10, "name": 'Rom-Com' }],
        overview: 'classic rom com with classic rom com actors'
      }
      movie = Movie.new(movie_data) 
      
      expect(movie.runtime_calc).to eq('1hr 55min')
    end
  end
end
