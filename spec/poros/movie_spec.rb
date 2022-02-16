require 'rails_helper'

RSpec.describe Movie do
  let(:movie) { TmdbFacade.details(278) }

  xit 'attributes' do
    expect(movie.id).to eq(278)
    expect(movie.title).to eq('The Shawshank Redemption')
    expect(movie.summary).to be_a(String)
    expect(movie.vote_average).to eq(8.7)
    expect(movie.vote_count).to eq(20_683)
    expect(movie.poster_path).to eq('/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg')
    expect(movie.total_min).to eq(142)
    expect(movie.runtime).to eq('2hr 22 min')
    expect(movie.cast).to be_a(Hash)
    expect(movie.genres).to eq(%w[Drama Crime])
  end
end
