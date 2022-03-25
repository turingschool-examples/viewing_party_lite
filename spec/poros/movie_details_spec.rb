require 'rails_helper'

RSpec.describe MovieDetails do
  before :each do
    @data = {
      title: 'Batman',
      genres: [{:id=>18, :name=>"Drama"}, {:id=>80, :name=>"Crime"}],
      runtime: 150,
      overview: 'Really good batman movie',
      vote_average: 8.8,
      id: 299
    }
  end
  it 'has attributes', :vcr do

    mov_details = MovieDetails.new(@data)

    expect(mov_details).to be_an_instance_of(MovieDetails)
    expect(mov_details.title).to eq('Batman')
    expect(mov_details.genres).to eq([{:id=>18, :name=>"Drama"}, {:id=>80, :name=>"Crime"}])
    expect(mov_details.run_time).to eq(150)
    expect(mov_details.summary).to eq('Really good batman movie')
    expect(mov_details.vote_average).to eq(8.8)
    expect(mov_details.id).to eq(299)
  end

  it '.get_genres', :vcr do
    mov_details = MovieDetails.new(@data)
    genres = mov_details.get_genres

    expect(genres).to eq(['Drama', 'Crime'])
  end

  it '.format_time', :vcr do
    mov_details = MovieDetails.new(@data)
    formatted_time = mov_details.format_time

    expect(formatted_time).to eq('2hr 30 min')
  end
end
