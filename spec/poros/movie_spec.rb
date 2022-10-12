require 'rails_helper'

RSpec.describe Movie do
  it 'has attributes' do
    data = { movie_id: 278, title: 'Movie', rating: 8.9}
    movie = Movie.new(data)

    expect(movie.id).to eq 278
  end
end