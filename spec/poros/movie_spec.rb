require 'rails_helper'

RSpec.describe Movie, type: :poro do
  describe '#initialize' do
    it 'exists and has attributes' do
      data = { adult: false,
               backdrop_path: '/hdHIjZxq3SWFqpAz4NFhdbud0iz.jpg',
               belongs_to_collection: { id: 8091, name: 'Alien Collection', poster_path: '/iVzIeC3PbG9BtDAudpwSNdKAgh6.jpg',
                                        backdrop_path: '/kB0Y3uGe9ohJa59Lk8UO9cUOxGM.jpg' },
               budget: 11_000_000,
               genres: [{ id: 27, name: 'Horror' }, { id: 878, name: 'Science Fiction' }],
               homepage: 'https://www.20thcenturystudios.com/movies/alien',
               id: 348,
               imdb_id: 'tt0078748',
               original_language: 'en',
               original_title: 'Alien',
               overview: 'During its return to the earth, commercial spaceship Nostromo intercepts a distress signal from a distant planet. When a three-member team of the crew discovers a chamber containing thousands of eggs on the planet, a creature inside one of the eggs attacks an explorer. The entire crew is unaware of the impending nightmare set to descend upon them when the alien parasite planted inside its unfortunate host is birthed.',
               popularity: 57.902,
               poster_path: '/vfrQk5IPloGg1v9Rzbh2Eg3VGyM.jpg',
               production_companies: [{ id: 25, logo_path: '/qZCc1lty5FzX30aOCVRBLzaVmcp.png', name: '20th Century Fox', origin_country: 'US' },
                                      { id: 19_747, logo_path: nil, name: 'Brandywine Productions',
                                        origin_country: 'US' }],
               production_countries: [{ iso_3166_1: 'US', name: 'United States of America' },
                                      { iso_3166_1: 'GB', name: 'United Kingdom' }],
               release_date: '1979-05-25',
               revenue: 104_931_801,
               runtime: 117,
               spoken_languages: [{ english_name: 'English', iso_639_1: 'en', name: 'English' },
                                  { english_name: 'Spanish', iso_639_1: 'es', name: 'Español' }],
               status: 'Released',
               tagline: 'In space no one can hear you scream.',
               title: 'Alien',
               video: false,
               vote_average: 8.137,
               vote_count: 12_468 }

      cast = [build_list(:cast, 10)]
      reviews = [build_list(:review, 5)]
      movie = Movie.new(data, cast, reviews)

      expect(movie).to be_a Movie
      expect(movie.title).to eq('Alien')
      expect(movie.vote_average).to eq(8.137)
      expect(movie.runtime).to eq(117)
      expect(movie.genres).to eq([{ id: 27, name: 'Horror' }, { id: 878, name: 'Science Fiction' }])
      expect(movie.summary).to eq('During its return to the earth, commercial spaceship Nostromo intercepts a distress signal from a distant planet. When a three-member team of the crew discovers a chamber containing thousands of eggs on the planet, a creature inside one of the eggs attacks an explorer. The entire crew is unaware of the impending nightmare set to descend upon them when the alien parasite planted inside its unfortunate host is birthed.')
      expect(movie.id).to eq(348)
    end
  end
end
