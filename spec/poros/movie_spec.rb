require 'rails_helper'

RSpec.describe Movie do
  it 'exist with attributes' do
    movie = Movie.new({ id: 1, title: 'Avatar', vote_average: 10, runtime: 180, overview: 'this is the overview', hours_mins: '3 hr 0 min', genres: [
                        {
                          "id": 18,
                          "name": 'Drama'
                        },
                        {
                          "id": 80,
                          "name": 'Crime'
                        }
                      ], image: '/9Baumh5J9N1nJUYzNkm0xsgjpwY.jpg' })

    expect(movie).to be_a(Movie)
    expect(movie.id).to eq(1)
    expect(movie.vote_average).to eq(10)
    expect(movie.runtime).to eq(180)
    expect(movie.overview).to eq('this is the overview')
    expect(movie.hours_mins).to eq('3hr 0min')
    expect(movie.genres).to eq(%w[Drama Crime])
  end

  it '#convert_runtime' do
    movie = Movie.new({ id: 1, title: 'Avatar', vote_average: 10, runtime: 175, overview: 'this is the overview', hours_mins: '3 hr 0 min', genres: [
                        {
                          "id": 18,
                          "name": 'Drama'
                        },
                        {
                          "id": 80,
                          "name": 'Crime'
                        }
                      ], image: '/9Baumh5J9N1nJUYzNkm0xsgjpwY.jpg' })
    expect(movie.convert_runtime(175)).to eq('2hr 55min')
  end

  it '#convert_genres' do
    movie = Movie.new({ id: 1, title: 'Avatar', vote_average: 10, runtime: 175, overview: 'this is the overview', hours_mins: '3 hr 0 min', genres: [
                        {
                          "id": 18,
                          "name": 'Drama'
                        },
                        {
                          "id": 80,
                          "name": 'Crime'
                        }
                      ], image: '/9Baumh5J9N1nJUYzNkm0xsgjpwY.jpg' })
    expect(movie.convert_genres([
                                  {
                                    "id": 18,
                                    "name": 'Drama'
                                  },
                                  {
                                    "id": 80,
                                    "name": 'Crime'
                                  }
                                ])).to eq(%w[Drama Crime])
  end
end
