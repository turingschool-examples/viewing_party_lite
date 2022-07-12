require 'rails_helper'
RSpec.describe TopMovie do
  it 'exists with attributes' do
    top_movie_data = {
      adult: false,
      backdrop_path: '/wPU78OPN4BYEgWYdXyg0phMee64.jpg',
      genre_ids: [18, 80],
      id: 278,
      original_language: 'en',
      original_title: 'The Shawshank Redemption',
      overview: 'Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.',
      popularity: 83.122,
      poster_path: '/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg',
      release_date: '1994-09-23',
      title: 'The Shawshank Redemption',
      video: false,
      vote_average: 8.7,
      vote_count: 21_018
    }
    top_movie = TopMovie.new(top_movie_data)
    expect(top_movie).to be_a TopMovie
    expect(top_movie.title).to eq('The Shawshank Redemption')
    expect(top_movie.vote).to eq(8.7)
  end
end
