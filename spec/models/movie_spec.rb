require 'rails_helper'

describe Movie do
  it 'exists' do
    movie = Movie.new({:title => "The Shawshank Redemption", :vote_average => "8.7"})
    expect(movie).to be_an_instance_of(Movie)
  end

  it 'attributes' do
    movie = Movie.new({:title => "The Shawshank Redemption", :vote_average => "8.7"})
    expect(movie.title).to eq("The Shawshank Redemption")
    expect(movie.vote_average).to eq("8.7")
  end
end
