require 'rails_helper'

RSpec.describe MovieDetail do 
  before :each do 
    response = File.read('./spec/fixtures/green_mile/details_response.json')
    @data = JSON.parse(response, symbolize_names: true)
  end 

    it 'exists and has attributes' do 

    movie = MovieDetail.new(@data)

    expect(movie).to be_an_instance_of(MovieDetail)
    expect(movie.title).to eq("The Green Mile")
    expect(movie.vote_average).to eq(8.507)
    expect(movie.runtime).to eq(189)
    expect(movie.genres).to eq([
      {
          "id": 14,
          "name": "Fantasy"
      },
      {
          "id": 18,
          "name": "Drama"
      },
      {
          "id": 80,
          "name": "Crime"
      }
    ])
    expect(movie.overview).to eq("A supernatural tale set on death row in a Southern prison, where gentle giant John Coffey possesses the mysterious power to heal people's ailments. When the cell block's head guard, Paul Edgecomb, recognizes Coffey's miraculous gift, he tries desperately to help stave off the condemned man's execution.")
  end

  describe 'list_genres' do 
    it 'can list out the name of each genre for the movie' do 
        movie = MovieDetail.new(@data)

        expect(movie.list_genres).to eq("Fantasy, Drama, Crime")
    end 
  end
end