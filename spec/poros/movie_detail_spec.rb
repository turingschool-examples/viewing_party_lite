require 'rails_helper'

RSpec.describe MovieDetail do
  let(:dune) do
    MovieDetail.new({
                      id: 1,
                      title: 'Dune',
                      vote_average: 7.9,
                      overview: 'Good movie',
                      genres: [{ id: 28, name: 'Action' }, { id: 878, name: 'Science Fiction' }],
                      runtime: 155,
                      poster_path: "dune.jpg"
                    })
  end

  it 'exists with attributes' do
    expect(dune).to be_an_instance_of(MovieDetail)
    expect(dune.id).to eq(1)
    expect(dune.title).to eq('Dune')
    expect(dune.vote_average).to eq(7.9)
    expect(dune.runtime).to eq('2hr 35min')
    expect(dune.runtime_min).to eq(155)
    expect(dune.genre.first).to eq({ id: 28, name: 'Action' })
    expect(dune.genre.last).to eq({ id: 878, name: 'Science Fiction' })
    expect(dune.summary).to eq('Good movie')
    expect(dune.poster_path).to eq("https://image.tmdb.org/t/p/originaldune.jpg")
  end
  it 'returns genre names as an array' do
    expect(dune.genre_names).to eq(['Action', 'Science Fiction'])
  end
end
