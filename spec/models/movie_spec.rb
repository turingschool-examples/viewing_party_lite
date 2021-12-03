require 'rails_helper'

describe Movie do
  before :each do
    @movie = Movie.new({:title => "The Shawshank Redemption",
                       :vote_average => "8.7",
                       :genres => [{:id=>18, :name=>"Drama"}],
                       :poster_path=>"/39wmItIWsg5sZMyRUHLkWBcuVCM.jpg",
                       :runtime => 120,
                       :overview => 'Good movie'
                       })
  end

  it 'exists' do
    expect(@movie).to be_an_instance_of(Movie)
  end

  it 'attributes' do
    expect(@movie.title).to eq("The Shawshank Redemption")
    expect(@movie.vote_average).to eq("8.7")
    expect(@movie.genres).to eq(["Drama"])
    expect(@movie.poster).to eq("https://image.tmdb.org/t/p/w500//39wmItIWsg5sZMyRUHLkWBcuVCM.jpg")
    expect(@movie.overview).to eq("Good movie")
  end

  it 'runtime_in_minutes' do
    short_movie = Movie.new({:runtime => 100})

    expect(@movie.runtime_in_minutes).to eq('2 hrs 0 min')
    expect(short_movie.runtime_in_minutes).to eq('1 hr 40 min')
  end
end
