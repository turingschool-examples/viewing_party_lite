require 'rails_helper'
RSpec.describe MovieDetail do
  it 'exists with attributes' do
    detail_data = {
      adult: false,
      backdrop_path: '/90ez6ArvpO8bvpyIngBuwXOqJm5.jpg',
      belongs_to_collection: nil,
      budget: 13_200_000,
      genres: [{ id: 35, name: 'Comedy' }, { id: 18, name: 'Drama' },
               { id: 10_749, name: 'Romance' }],
      homepage: '',
      id: 19_404,
      imdb_id: 'tt0112870',
      original_language: 'hi',
      original_title: 'दिलवाले दुल्हनिया ले जायेंगे',
      overview: 'Raj is a rich, carefree, happy-go-lucky second generation NRI. Simran is the daughter of Chaudhary Baldev Singh, who in spite of being an NRI is very strict about adherence to Indian values. Simran has left for India to be married to her childhood fiancé. Raj leaves for India with a mission at his hands, to claim his lady love under the noses of her whole family. Thus begins a saga.',
      popularity: 30.856,
      poster_path: '/2CAL2433ZeIihfX1Hb2139CX0pW.jpg',
      production_companies: [{ id: 1569, logo_path: '/lvzN86o3jrP44DIvn4SMBLOl9PF.png', name: 'Yash Raj Films',
                               origin_country: 'IN' }],
      production_countries: [{ iso_3166_1: 'IN', name: 'India' }],
      release_date: '1995-10-20',
      revenue: 100_000_000,
      runtime: 190,
      spoken_languages: [{ english_name: 'Hindi', iso_639_1: 'hi', name: 'हिन्दी' }],
      status: 'Released',
      tagline: 'Come Fall In love, All Over Again..',
      title: 'Dilwale Dulhania Le Jayenge',
      video: false,
      vote_average: 8.7,
      vote_count: 3526
    }

    details = MovieDetail.new(detail_data)
    expect(details).to be_a MovieDetail
    expect(details.title).to eq('Dilwale Dulhania Le Jayenge')
    expect(details.runtime).to eq(190)
    expect(details.all_genere_names).to eq(%w[Comedy Drama Romance])
    expect(details.vote).to eq(8.7)
    expect(details.summary).to eq('Raj is a rich, carefree, happy-go-lucky second generation NRI. Simran is the daughter of Chaudhary Baldev Singh, who in spite of being an NRI is very strict about adherence to Indian values. Simran has left for India to be married to her childhood fiancé. Raj leaves for India with a mission at his hands, to claim his lady love under the noses of her whole family. Thus begins a saga.')
  end
end
