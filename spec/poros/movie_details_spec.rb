require 'rails_helper'

RSpec.describe MovieDetails do
  it 'has attributes', :vcr do
    movie = MovieDetails.new(MovieService.movie_details(278))

    expect(movie.movie_id).to eq 278
    expect(movie.title).to eq('The Shawshank Redemption')
    expect(movie.rating).to eq(8.7)
    expect(movie.runtime).to eq(142)
    expect(movie.genres).to eq(['Drama', 'Crime'])
    expect(movie.summary).to include(' murder of his wife and her lover,')
    expect(movie.reviews.count).to eq 7
    expect(movie.cast.count).to eq 10
    expect(movie.poster_path).to eq("/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg")
  end
end